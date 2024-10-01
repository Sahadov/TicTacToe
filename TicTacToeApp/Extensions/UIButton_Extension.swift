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
    
    enum ImageName: String {
        case singlePlayer = "SinglePlayer"
        case twoPlayers = "TwoPlayers"
    }
    
    static func makeCustomButtonWithImage(with title: String, color: ButtonColor, imageName: ImageName) -> UIButton
    {
        var configuration = UIButton.Configuration.plain()
        configuration.title = title
        configuration.image = UIImage(named: imageName.rawValue)
        configuration.imagePadding = 10
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            return outgoing
        }
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
                
        switch color {
        case .blue:
            button.configuration?.baseForegroundColor = .white
            button.backgroundColor = UIColor(named: "AccentColor")
        case .gray:
            button.configuration?.baseForegroundColor = .black
            button.backgroundColor = UIColor(named: "BlueLight")
        case .white:
            button.configuration?.baseForegroundColor = UIColor(named: "AccentColor")
            button.backgroundColor = .white
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        }
        
        return button
    }
}
