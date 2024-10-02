//
//  LabelFactory.swift
//  TicTacToeApp
//
//  Created by Alexander Bokhulenkov on 02.10.2024.
//

import UIKit

final class LabelFactory {
    static func playerName(_ name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func selectedPlayerName(_ name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
