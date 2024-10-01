//
//  CardSettings.swift
//  TicTacToeApp
//
//  Created by user on 01.10.2024.
//

import UIKit


final class CardSettings: UIView {
    
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
    
    private let customButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init(image: UIImage, buttonTitle: String) {
        super.init(frame: .zero)
        customImage.image = image
        customButton.setTitle(buttonTitle, for: .normal)
        
        xSkinView.image = UIImage(named: "Nought")
        oSkinView.image = UIImage(named: "Cross")
        
        addSubview(customView)
        
        setupLayout()
        setupStack(image: customImage)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            customView.heightAnchor.constraint(equalToConstant: 152),
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
            customButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        layer.cornerRadius = 30
        layer.borderWidth = 1
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 16
        layer.shadowOffset = CGSize(width: 5, height: 5)
        
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
