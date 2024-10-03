//
//  GameCollectionViewCell.swift
//  TicTacToeApp
//
//  Created by Alexander Bokhulenkov on 01.10.2024.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    static let identifier = GameCollectionViewCell.description()
    
    private let gameImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(gameImage)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -
    
    public func configure(image: UIImage?) {
        gameImage.image = image
    }
}

// MARK: - Extensions Set Constraints
extension GameCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            gameImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
