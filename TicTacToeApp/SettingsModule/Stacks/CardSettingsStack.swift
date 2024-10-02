//
//  CardSettingsStack.swift
//  TicTacToeApp
//
//  Created by user on 01.10.2024.
//

import UIKit

final class CardSettingsStack: UIStackView {
    
    init(cards: [CardSettings]) {
        super.init(frame: .zero)
        
        axis = .horizontal
        spacing = 12
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        
        for card in cards {
            addArrangedSubview(card)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
}
