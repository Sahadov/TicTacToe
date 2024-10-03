//
//  SettingsViewController.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//


import UIKit


final class SettingsViewController: BaseViewController {
    
    //MARK: - Private Property
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()  // Контейнер для содержимого scrollView
    
    private let gameTimeView = GameTimeView()
    
    private var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let card1 = CardSettings(image: UIImage(named: "Cross")!, buttonTitle: "Coose")
    private let card2 = CardSettings(image: UIImage(named: "Cross")!, buttonTitle: "Coose")
    private let card3 = CardSettings(image: UIImage(named: "Cross")!, buttonTitle: "Coose")
    private let card4 = CardSettings(image: UIImage(named: "Cross")!, buttonTitle: "Coose")
    private let card5 = CardSettings(image: UIImage(named: "Cross")!, buttonTitle: "Coose")
    private let card6 = CardSettings(image: UIImage(named: "Cross")!, buttonTitle: "Coose")
    
    private lazy var horizontalStack1 = CardSettingsStack(cards: [card1, card2])
    private lazy var horizontalStack2 = CardSettingsStack(cards: [card3, card4])
    private lazy var horizontalStack3 = CardSettingsStack(cards: [card5, card6])
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        
        addViews()
        setupStackVertical()
        setupGameView()
        setupScrollView()
    }
    
    
    
    //MARK: - Private Methods
    
    private func setupGameView() {
        gameTimeView.backgroundColor = .white
        gameTimeView.layer.cornerRadius = 30
        gameTimeView.layer.shadowColor = UIColor.black.cgColor
        gameTimeView.layer.shadowOpacity = 0.2
        gameTimeView.layer.shadowRadius = 16
        gameTimeView.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    
    private func addViews() {
        
        contentView.addSubview(gameTimeView)
        contentView.addSubview(stackViewVertical)
        
        stackViewVertical.addArrangedSubview(horizontalStack1)
        stackViewVertical.addArrangedSubview(horizontalStack2)
        stackViewVertical.addArrangedSubview(horizontalStack3)
    }
    
    
    //MARK: - Layout
    
    private func setupScrollView() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.alwaysBounceVertical = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView) // Добавлен контент в contentView внутри scrollView
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    
    private func setupStackVertical() {
        gameTimeView.translatesAutoresizingMaskIntoConstraints = false
        stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Ограничения для gameTimeView
            gameTimeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            gameTimeView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameTimeView.widthAnchor.constraint(equalToConstant: 350),
            gameTimeView.heightAnchor.constraint(equalToConstant: 270),
            
            // Ограничения для stackViewVertical
            stackViewVertical.topAnchor.constraint(equalTo: gameTimeView.bottomAnchor, constant: 40),
            stackViewVertical.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackViewVertical.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackViewVertical.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40), // Для правильного скролла
            stackViewVertical.heightAnchor.constraint(equalToConstant: 340)
        ])
    }
}

