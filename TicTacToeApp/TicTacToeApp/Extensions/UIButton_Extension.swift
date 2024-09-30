//
//  UIButton_Extension.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//

import UIKit

extension UIButton {
    
    enum ButtonColor {
            case blue
            case gray
            case white
        }
    
    static func makeCustomButton(with title: String, color: ButtonColor) -> UIButton
    {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch color {
            case .blue:
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = UIColor(named: "AccentColor")
            case .gray:
                button.setTitleColor(.black, for: .normal)
                button.backgroundColor = UIColor(named: "BlueLight")
            case .white:
                button.setTitleColor(UIColor(named: "AccentColor"), for: .normal)
                button.backgroundColor = .white
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
                            
        }
        return button
    }
}
