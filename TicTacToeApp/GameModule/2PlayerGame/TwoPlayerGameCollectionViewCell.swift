//
//  TwoPlayerGameCollectionViewCell.swift
//  TicTacToeApp
//
//  Created by Bakgeldi Alkhabay on 03.10.2024.
//

import UIKit

class TwoPlayerGameCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static let identifier = TwoPlayerGameCollectionViewCell.description()
    
    // MARK: - UI Elements
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup View
    private func setupView() {
        // Добавление imageView к содержимому ячейки
        contentView.addSubview(imageView)
        
        // Установка ограничений для imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Configure Cell
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}

