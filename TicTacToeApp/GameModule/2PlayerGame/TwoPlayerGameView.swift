//
//  TwoPlayerGameView.swift
//  TicTacToeApp
//
//  Created by Bakgeldi Alkhabay on 03.10.2024.
//

import UIKit

final class TwoPlayerGameView: UIView {
    
    // MARK: - UI
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstPlayerContainer = UIView.playerContainer()
    private let playerImage1 = UIImageViewFactory.setPlayerImage(UIImage.CustomImage.cross)
    private let playerLabel1 = LabelFactory.playerName("You")
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "1:59"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondPlayerContainer = UIView.playerContainer()
    private let playerImage2 = UIImageViewFactory.setPlayerImage(UIImage.CustomImage.nought)
    private let playerLabel2 = LabelFactory.playerName("Player Two")
    
    
    private let selectedPlayerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectPlayerImage = UIImageViewFactory.setPlayerImage(UIImage.CustomImage.nought)
    
    private let selectPlayerLabel = LabelFactory.playerName("You turn")
    
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let layoutView: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()
    
    lazy var fieldCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutView)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
        setConstraints()
    }
    
    // MARK: - Settings View
    
    private func setView() {
        
        self.addSubview(headerView)
        firstPlayerContainer.addSubview(playerImage1)
        firstPlayerContainer.addSubview(playerLabel1)
        secondPlayerContainer.addSubview(playerImage2)
        secondPlayerContainer.addSubview(playerLabel2)
        headerView.addSubview(firstPlayerContainer)
        headerView.addSubview(timeLabel)
        headerView.addSubview(secondPlayerContainer)
        selectedPlayerView.addSubview(selectPlayerImage)
        selectedPlayerView.addSubview(selectPlayerLabel)
        self.addSubview(selectedPlayerView)
        containerView.addSubview(fieldCollection)
        self.addSubview(containerView)
        
        fieldCollection.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.identifier)
    }
    
    func setDelegate(_ delegate: TwoPlayerGameViewController) {
        fieldCollection.delegate = delegate
        fieldCollection.dataSource = delegate
    }
    
}


// MARK: - Extensions Constraints
extension TwoPlayerGameView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            headerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            headerView.heightAnchor.constraint(equalToConstant: 103),
            
            firstPlayerContainer.widthAnchor.constraint(equalToConstant: 103),
            firstPlayerContainer.heightAnchor.constraint(equalToConstant: 103),
            firstPlayerContainer.topAnchor.constraint(equalTo: headerView.topAnchor),
            firstPlayerContainer.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            
            playerImage1.topAnchor.constraint(equalTo: firstPlayerContainer.topAnchor, constant: 10),
            playerImage1.centerXAnchor.constraint(equalTo: firstPlayerContainer.centerXAnchor),
            playerLabel1.topAnchor.constraint(equalTo: playerImage1.bottomAnchor, constant: 10),
            playerLabel1.centerXAnchor.constraint(equalTo: firstPlayerContainer.centerXAnchor),
            
            timeLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            secondPlayerContainer.widthAnchor.constraint(equalToConstant: 103),
            secondPlayerContainer.heightAnchor.constraint(equalToConstant: 103),
            secondPlayerContainer.topAnchor.constraint(equalTo: headerView.topAnchor),
            secondPlayerContainer.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            playerImage2.topAnchor.constraint(equalTo: secondPlayerContainer.topAnchor, constant: 10),
            playerImage2.centerXAnchor.constraint(equalTo: secondPlayerContainer.centerXAnchor),
            playerLabel2.topAnchor.constraint(equalTo: playerImage2.bottomAnchor, constant: 10),
            playerLabel2.centerXAnchor.constraint(equalTo: secondPlayerContainer.centerXAnchor),
            
            selectedPlayerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            selectedPlayerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 84),
            selectedPlayerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -84),
            selectedPlayerView.heightAnchor.constraint(equalToConstant: 53),
            
            selectPlayerImage.centerXAnchor.constraint(equalTo: selectedPlayerView.centerXAnchor, constant: -54),
            selectPlayerLabel.centerYAnchor.constraint(equalTo: selectedPlayerView.centerYAnchor),
            selectPlayerLabel.leadingAnchor.constraint(equalTo: selectPlayerImage.trailingAnchor, constant: 5),
            
            
            containerView.topAnchor.constraint(equalTo: selectedPlayerView.bottomAnchor, constant: 30),
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 400),
            
            fieldCollection.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            fieldCollection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            fieldCollection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            fieldCollection.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
    }
}
