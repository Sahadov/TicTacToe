import Foundation

enum GameResult {
    case win
    case lose
    case draw
    
    var message: String {
        switch self {
        case .win:
            return "Player One Win!"
        case .lose:
            return "You Lose!"
        case .draw:
            return "Draw!"
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
        }
    }
}
