//
//  SettingsCollection.swift
//  TicTacToeApp
//
//  Created by user on 03.10.2024.
//

import UIKit

class YourViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка коллекции с макетом
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Регистрация ячейки
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
    }
    
    // Создание Compositional Layout
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            // Размер элемента
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            // Размер группы
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // Секция
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
    }
}

// MARK: - UICollectionViewDataSource
extension YourViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Здесь можно вернуть количество элементов
        return 6 // как на изображении (3 ряда по 2 колонки)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Настраиваем ячейку: добавляем изображение или текст на основе indexPath
        cell.contentView.backgroundColor = .lightGray // пример фона
        
        // Пример: добавляем UILabel в ячейку
        let label = UILabel(frame: cell.contentView.bounds)
        label.text = "Элемент \(indexPath.row + 1)"
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension YourViewController: UICollectionViewDelegate {
    // Здесь можно обрабатывать взаимодействие с ячейками, например, выбор карточки
}
