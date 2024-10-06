//
//  Main.swift
//  TicTacToeApp
//
//  Created by user on 04.10.2024.
//


import UIKit

final class GameSettingsViewController: BaseViewController {
    
    //MARK: - Private Property
    private let gameTimeView = GameTimeView()
    let storageManager = StorageManager()
    
    var selectedIndexPath: IndexPath? //  выбранная ячейка
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 150)
        layout.minimumLineSpacing = 26
        layout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 80, right: 30)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.CustomColors.backgroundBlue
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingViewCell.self, forCellWithReuseIdentifier: SettingViewCell.reusedId)
        return collectionView
    }()
    
    let images = [
        UIImage.CustomImage.burger,
        UIImage.CustomImage.cross,
        UIImage.CustomImage.crossWithBg,
        UIImage.CustomImage.crossYelow,
        UIImage.CustomImage.frenchFries,
        UIImage.CustomImage.heart,
        UIImage.CustomImage.iceCream,
        UIImage.CustomImage.nought,
        UIImage.CustomImage.noughtGreen,
        UIImage.CustomImage.noughtWithBg,
        UIImage.CustomImage.pie,
        UIImage.CustomImage.star,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.CustomColors.backgroundBlue
        
        if let savedIndex = storageManager.getSelectedCellIndex(forKey: .selectedCellIndex) {
            selectedIndexPath = IndexPath(item: savedIndex, section: 0)
        }
        
        setupView()
        setupConstraints()
        
    }
}


//MARK: - Layout
private extension GameSettingsViewController {
    
    func setupView() {
        
        view.addSubview(gameTimeView)
        view.addSubview(collectionView)
        
        gameTimeView.backgroundColor = UIColor.CustomColors.backgroundWhite
        gameTimeView.layer.cornerRadius = 30
        gameTimeView.layer.shadowColor = UIColor.black.cgColor
        gameTimeView.layer.shadowOpacity = 0.2
        gameTimeView.layer.shadowRadius = 16
        gameTimeView.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    
    func setupConstraints() {
        gameTimeView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gameTimeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gameTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            gameTimeView.heightAnchor.constraint(equalToConstant: 344),
            
            collectionView.topAnchor.constraint(equalTo: gameTimeView.bottomAnchor, constant: 26),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}



//MARK: - UICollectionViewDelegate
 extension GameSettingsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousSelectedIndexPath = selectedIndexPath {
            selectedIndexPath = indexPath
            collectionView.reloadItems(at: [previousSelectedIndexPath, indexPath])
           
        } else {
            selectedIndexPath = indexPath
            collectionView.reloadItems(at: [indexPath])
        }
        
        storageManager.set(indexPath.item, forKey: .selectedCellIndex)
        
    }
}


//MARK: - UICollectionViewDataSource
extension GameSettingsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingViewCell.reusedId, for: indexPath) as! SettingViewCell

        
        // Присваиваем уникальные изображения для каждой ячейки
        let image1 = images[indexPath.item % images.count]
        let image2 = images[(indexPath.item + 1) % images.count]
        
        cell.crossImageName.image = image1
        cell.noughtImageName.image = image2
        
        
        // Если ячейка выбрана, меняем текст кнопки на "Picked"
        let isPicked = selectedIndexPath == indexPath
        cell.setPicked(isPicked)
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}



