//
//  GameModel.swift
//  TicTacToeApp
//
//  Created by Alexander Bokhulenkov on 05.10.2024.
//

import Foundation

struct Field {
    let player: Player
    let fieldIndex: Int
    var playerLogo: String {
        return player == .cross ? "Cross" : "Nought"
    }
}
