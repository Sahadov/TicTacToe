//
//  PCGameLogic.swift
//  TicTacToeApp
//
//  Created by Alexander Bokhulenkov on 05.10.2024.
//

import UIKit

final class PCGameLogic {
    
    private var gameField: [Field?] = .init(repeating: nil, count: 9)
    
    //    проверка поля на свободную ячейку
    func isSquareOccupied(in field: [Field?], forIndex index: Int ) -> Bool {
        return field.contains { $0?.fieldIndex == index }
    }
    
    //    проверка на выигрыш
    func checkWin(for player: Player?, in field: [Field?]) -> Bool {
        let winPaterns: Set<Set<Int>> = [ [0,1,2], [3,4,5], [6,7,8],
                                          [0,3,6], [1,4,7], [2,5,8],
                                          [0,4,8], [2,4,6]]
        let playerMoves = field.compactMap { $0 }.filter { $0.player == player}
        let playerPositions = Set(playerMoves.map { $0.fieldIndex })
        for patern in winPaterns where patern.isSubset(of: playerPositions) {
            return true
        }
        return false
    }
    
    func checkForDraw(in field: [Field?]) -> Bool {
        return field.compactMap{$0}.count == gameField.count
    }
    
    //    компьютерная игра
    func computerMove(gameField: [Field?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        while isSquareOccupied(in: gameField, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    
}
