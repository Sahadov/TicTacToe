//
//  Main.swift
//  TicTacToeApp
//
//  Created by user on 04.10.2024.
//


import UIKit

class GameSettingsViewController: BaseViewController {
    
    private let gameTimeView = GameTimeView()
    
    var selectedIndexPath: IndexPath? // Для отслеживания выбранной ячейки
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 150) // Пример размера ячеек
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
        
        setupView()
        setupConstraints()
        
    }
}


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
    
    
    private func setupConstraints() {
        gameTimeView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gameTimeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gameTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            gameTimeView.heightAnchor.constraint(equalToConstant: 280),
            
            collectionView.topAnchor.constraint(equalTo: gameTimeView.bottomAnchor, constant: 26),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}




extension GameSettingsViewController: UICollectionViewDelegate {
    
    // Вызывается при нажатии на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Проверяем, была ли выбрана другая ячейка ранее
        if let previousSelectedIndexPath = selectedIndexPath {
            // Сбрасываем состояние старой выбранной ячейки
            selectedIndexPath = indexPath
            collectionView.reloadItems(at: [previousSelectedIndexPath, indexPath])
        } else {
            // Если до этого не было выбранной ячейки
            selectedIndexPath = indexPath
            collectionView.reloadItems(at: [indexPath])
        }
    }
    
}

extension GameSettingsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingViewCell.reusedId, for: indexPath) as! SettingViewCell
        
        // Присваиваем уникальные изображения для каждой ячейки
        let image1 = images[indexPath.item]
        let image2 = images[(indexPath.item + 1)]
        
        cell.imageView1.image = image1
        cell.imageView2.image = image2
        
        
        // Если ячейка выбрана, меняем текст кнопки на "Picked"
        let isPicked = selectedIndexPath == indexPath
        cell.setPicked(isPicked)
        
        cell.customButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    @objc func didTap() {
        print("ksjdnskdnc")
    }
    
    
}



