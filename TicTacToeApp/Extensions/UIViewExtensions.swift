//
//  UIViewExtensions.swift
//  TicTacToeApp
//
//  Created by Alexander Bokhulenkov on 02.10.2024.
//

import UIKit

extension UIView {
    static func playerContainer() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.CustomColors.lightBlue
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static func makeContainerView(backgroundColor: UIColor = .white) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor(red: 0.604, green: 0.624, blue: 0.765, alpha: 0.35).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 30
        view.layer.masksToBounds = false
        
        return view
    }
}
