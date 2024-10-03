//
//  View.swift
//  TicTacToeApp
//
//  Created by user on 03.10.2024.
//

import UIKit

class SettingViewCell: UICollectionViewCell {
    
    
    static let reusedId = "Favorite Cell"
    var completion: (() -> Void)?
    
    lazy var cellImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var cellButton: UIButton = {
        $0.frame = CGRect(x: 100, y: 100, width: 60, height: 20)
        $0.tintColor = .black
        return $0
    }(UIButton(primaryAction: UIAction(handler: { [weak self] _ in self?.completion?()})))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [ cellImage, cellButton].forEach { view in
            addSubview(view)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
