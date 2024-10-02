//
//  UIImageViewFactory.swift
//  TicTacToeApp
//
//  Created by Alexander Bokhulenkov on 02.10.2024.
//

import UIKit

final class UIImageViewFactory {
    static func setPlayerImage(_ image: UIImage?) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
}
