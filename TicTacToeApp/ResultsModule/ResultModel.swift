import Foundation

enum GameResult {
    case win
    case lose
    case draw
    
    var message: String {
        switch self {
        case .win:
            return "Player 1 Won!"
        case .lose:
            return "Player 2 Won!"
        case .draw:
            return "Draw!"
        }
    }
    
    var imageName: String {
        switch self {
        case .win:
            return "Win"
        case .lose:
            return "Win"
        case .draw:
            return "Draw"
        }
    }
}
