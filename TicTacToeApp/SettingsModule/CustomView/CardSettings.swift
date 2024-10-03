//
//  CardSettings.swift
//  TicTacToeApp
//
//  Created by user on 01.10.2024.
//
import UIKit

protocol CardSettingsProtocol: AnyObject {
    func changeButton(_ button: UIButton)
}

final class CardSettings: UIView {
    
    
    var isSelected: Bool {
        didSet {
            updateButtonAppearance()
        }
    }
    
    
    weak var delegate: CardSettingsProtocol?
    
    //MARK: - Private Property
    
    private let xSkinView = UIImageView()
    private let oSkinView = UIImageView()
    
    private let customView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.layer.cornerRadius = 24
        customView.backgroundColor = .white
        return customView
    }()
    
    private let customImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
   
    var customButton = UIButton.makeCustomButton(with: "Choose", color: .gray)
    
    init() {
        isSelected = false
        super.init(frame: .zero)
        
        xSkinView.image = UIImage(named: "Cross")
        oSkinView.image = UIImage(named: "Cross")
        
        addSubview(customView)
        
        customButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        setupLayout()
        setupStack(image: customImage)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func didTapButton() {
        toggleButton()
        delegate?.changeButton(customButton)
        
        print("Кнопка нажата")
    }
    
    func toggleButton() {
        isSelected.toggle()
    }
    
    private func updateButtonAppearance() {
        UIView.animate(withDuration: 0.2) {
            self.customButton.backgroundColor = self.isSelected ? UIColor.purple : UIColor.lightGray
            self.customButton.setTitle(self.isSelected ? "Picked" : "Choose", for: .normal)
            
            self.xSkinView.tintColor = self.isSelected ? UIColor.systemPink : UIColor.yellow
            self.oSkinView.tintColor = self.isSelected ? UIColor.purple : UIColor.green
        }
    }
    
    //MARK: - Private Methods
    
    private func setupLayout() {
        [ customImage, customButton, imageStack].forEach { subView in
            customView.addSubview(subView)
        }
    }
    
    private func setupStack(image: UIImageView) {
        imageStack.addArrangedSubview(xSkinView)
        imageStack.addArrangedSubview(oSkinView)
    }
    
    //MARK: - Layout
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            customView.heightAnchor.constraint(equalToConstant: 160),
            customView.widthAnchor.constraint(equalToConstant: 166),
            
            customImage.topAnchor.constraint(equalTo: customView.topAnchor, constant: 12),
            customImage.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 12),
            customImage.heightAnchor.constraint(equalToConstant: 32),
            customImage.widthAnchor.constraint(equalToConstant: 32),
            
            imageStack.topAnchor.constraint(equalTo: customView.topAnchor, constant: 12),
            imageStack.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 12),
            imageStack.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -12),
            imageStack.heightAnchor.constraint(equalToConstant: 70),
            
            customButton.topAnchor.constraint(equalTo: imageStack.bottomAnchor, constant: 12),
            customButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 12),
            customButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -12),
            customButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        layer.borderWidth = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 16
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}

