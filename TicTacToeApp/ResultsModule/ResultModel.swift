import Foundation

enum GameResult {
    case win
    case lose
    case draw
    case player1
    case player2
    
    var message: String {
        switch self {
        case .win:
            return "You won!"
        case .lose:
            return "You lose!"
        case .draw:
            return "Draw!"
        case .player1:
            return "Player 1 Won!"
        case .player2:
            return "Player 2 Won!"
        }
    }
    
    var imageName: String {
        switch self {
        case .win:
            return "Win"
        case .lose:
            return "Lose"
        case .draw:
            return "Draw"
        case .player1:
            return "Win"
        case .player2:
            return "Win"
        }
    }
}
