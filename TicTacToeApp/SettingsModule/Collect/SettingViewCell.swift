//
//  Cell.swift
//  TicTacToeApp
//
//  Created by user on 04.10.2024.
//


import UIKit


final class SettingViewCell: UICollectionViewCell {
    
    static let reusedId = "SettingViewCell"
    
    let storageManager = StorageManager()
    
    
    //MARK: - Private Property
    
    private let imageStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let crossImageName = UIImageViewFactory.setPlayerImage(UIImage.CustomImage.cross)
    let noughtImageName = UIImageViewFactory.setPlayerImage(UIImage.CustomImage.nought)
    
    
    private let customButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
        setupConstraints()
        setupStack()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func setupView() {
        // Настройка внешнего вида ячейки
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .white
        
        //Тень для ячейки
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowRadius = 8
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        contentView.isUserInteractionEnabled = true
        
        
        //Экшн для кнопки
        customButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        [imageStack, customButton, crossImageName, noughtImageName].forEach { contentView.addSubview($0) }
    }
    
    private func setupStack() {
        imageStack.addArrangedSubview(crossImageName)
        imageStack.addArrangedSubview(noughtImageName)
    }
    
    
    @objc func didTapButton() {
        print("Button tapped!")
        
        guard let collectionView = superview as? UICollectionView,
              let indexPath = collectionView.indexPath(for: self) else { return }
        
        collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
        
        
        let crossImageName = crossImageName.image
        let noughtImageName = noughtImageName.image
        
        
        if let image1Name = crossImageName?.accessibilityIdentifier,
           let image2Name = noughtImageName?.accessibilityIdentifier {
            
            //передача в StorageManager
            let storageManager = StorageManager()
            storageManager.set(image1Name, forKey: .crossImageName)
            storageManager.set(image2Name, forKey: .noughtImageName)
            
            print("Saved image: \(image1Name), and: \(image2Name)")
        } else {
            print("Failed to save")
        }
    }
    
    
    
    //переключаем цвет и текст в кнопке
    func setPicked(_ isPicked: Bool) {
        if isPicked {
            customButton.setTitle("Picked", for: .normal)
            customButton.setTitleColor(UIColor.CustomColors.lightBlue, for: .normal)
            customButton.backgroundColor = UIColor.CustomColors.blue
        } else {
            customButton.setTitle("Choose", for: .normal)
            customButton.setTitleColor(UIColor.CustomColors.black, for: .normal)
            customButton.backgroundColor = UIColor.CustomColors.backgroundBlue
        }
    }
    
    
    //MARK: - Layout
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imageStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageStack.widthAnchor.constraint(equalToConstant: 100),
            imageStack.heightAnchor.constraint(equalToConstant: 50),
            
            customButton.topAnchor.constraint(equalTo: imageStack.bottomAnchor, constant: 10),
            customButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            customButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            customButton.heightAnchor.constraint(equalToConstant: 46),
            customButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}



