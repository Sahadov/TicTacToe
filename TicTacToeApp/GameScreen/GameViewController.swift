//
//  GameViewController.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Properties
    
    private let cellCount = 9
    
    // MARK: - UI
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstPlayerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.902, green: 0.914, blue: 0.976, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let playerImage1: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Cross")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playerLabel1: UILabel = {
        let label = UILabel()
        label.text = "You"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "1:59"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondPlayerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.902, green: 0.914, blue: 0.976, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let playerImage2: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Nought")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playerLabel2: UILabel = {
        let label = UILabel()
        label.text = "Player Two"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//   центр
    
    private let selectPlayerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectPlayerImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Nought")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let selectPlayerLabel: UILabel = {
        let label = UILabel()
        label.text = "You turn"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // игровое поле
    
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
    
    private lazy var fieldCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutView)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setDelegate()
        setConstraints()
        
    }

    
    // MARK: - Settings View
    
    private func setView() {
        view.backgroundColor = UIColor(red: 0.961, green: 0.969, blue: 1, alpha: 1)
        
        view.addSubview(headerView)
        firstPlayerContainer.addSubview(playerImage1)
        firstPlayerContainer.addSubview(playerLabel1)
        secondPlayerContainer.addSubview(playerImage2)
        secondPlayerContainer.addSubview(playerLabel2)
        headerView.addSubview(firstPlayerContainer)
        headerView.addSubview(timeLabel)
        headerView.addSubview(secondPlayerContainer)
        selectPlayerView.addSubview(selectPlayerImage)
        selectPlayerView.addSubview(selectPlayerLabel)
        view.addSubview(selectPlayerView)
        containerView.addSubview(fieldCollection)
        view.addSubview(containerView)
        
        fieldCollection.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        fieldCollection.delegate = self
        fieldCollection.dataSource = self
    }

}

// MARK: - Extensions CollectionView Delegate and DataSource

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = fieldCollection.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        cell.backgroundColor = UIColor(red: 0.902, green: 0.914, blue: 0.976, alpha: 1)
        cell.layer.cornerRadius = 20
        return cell
    }
}

// MARK: - Extensions CollectionViewDelegateFlowLayout

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame: CGRect = collectionView.frame
        var measuredWidth = collectionViewFrame.width
        measuredWidth = (measuredWidth/3) - (20.0/3)
        let measuredHeight = collectionView.frame.width/3
        return CGSize(width: measuredWidth, height: measuredHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
}

// MARK: - Extensions Constraints
extension GameViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
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
            
//            центральная часть
            selectPlayerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            selectPlayerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 84),
            selectPlayerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -84),
            selectPlayerView.heightAnchor.constraint(equalToConstant: 53),
            
            selectPlayerImage.centerXAnchor.constraint(equalTo: selectPlayerView.centerXAnchor, constant: -54),
            selectPlayerLabel.centerYAnchor.constraint(equalTo: selectPlayerView.centerYAnchor),
            selectPlayerLabel.leadingAnchor.constraint(equalTo: selectPlayerImage.trailingAnchor, constant: 5),
            
            
//            игра
            containerView.topAnchor.constraint(equalTo: selectPlayerView.bottomAnchor, constant: 30),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 400),
            
            fieldCollection.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            fieldCollection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            fieldCollection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            fieldCollection.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
    }
}
