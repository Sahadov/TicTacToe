//
//  GameViewController.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//

import UIKit

class GameViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let cellCount = 9
    private let gameView = GameView()
    
    private var field: [UIImage?] = .init(repeating: nil, count: 9)
    private let firstPlayer = "Cross"
    private let secondPlayer = "Nought"
    private var selectedField = true
    
    // MARK: - Life Cycle
    override func loadView() {
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.CustomColors.backgroundBlue
        gameView.setDelegate(self)
        gameView.delegate = self
    }
}

// MARK: - Extensions CollectionView Delegate and DataSource

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        cell.backgroundColor = UIColor.CustomColors.backgroundBlue
        cell.layer.cornerRadius = 20
        
        let image = field[indexPath.row]
        cell.configure(image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("выбрана ячейка с номером \(indexPath.item)")
        var image: UIImage?
        if selectedField {
            image = UIImage(named: firstPlayer)
            selectedField = false
        } else {
            image = UIImage(named: secondPlayer)
            selectedField = true
        }
        
        field[indexPath.row] = image
        collectionView.reloadItems(at: [indexPath])
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

// MARK: - Extensions GameViewDelegate
extension GameViewController: GameViewDelegate {
    func firstPlayer(isSelected: Bool) {
        selectedField = isSelected
    }
    
    
}
