import UIKit

enum Player {
    case cross
    case nought
}

class TwoPlayerGameLogic {
    var board: [Player?] = Array(repeating: nil, count: 9)
    var moveCount = 0
    
    private var currentPlayer: Player = .cross

    func makeMove(at index: Int) -> Player? {
        guard index < board.count && board[index] == nil else { return nil }
        
        board[index] = currentPlayer
        moveCount += 1
        
        let winner = checkForWinner()
        if winner != nil || moveCount == 9 {
            return winner
        }
        
        currentPlayer = (currentPlayer == .cross) ? .nought : .cross
        return nil
    }

    func currentPlayerSymbol() -> UIImage? {
        switch currentPlayer {
        case .cross:
            return UIImage.CustomImage.cross
        case .nought:
            return UIImage.CustomImage.nought
        }
    }
    
    func getCurrentPlayer() -> Player {
        return currentPlayer
    }

    private func checkForWinner() -> Player? {
        let winningCombinations: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        
        for combination in winningCombinations {
            if let first = board[combination[0]],
               first == board[combination[1]],
               first == board[combination[2]] {
                return first
            }
        }
        
        return nil
    }
}
