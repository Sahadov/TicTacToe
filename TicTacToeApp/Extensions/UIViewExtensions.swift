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
}
