import Foundation

struct LeaderModel {
    let time: String
}

extension LeaderModel {
    static func getLeaders(from times: [Int]) -> [LeaderModel]? {
        if let times = StorageManager().getArray(forKey: .leaderboard) {
            let sortedTimes = times.sorted()
            
            let formattedTimes = sortedTimes.map { time in
                let minutes = time / 60
                let seconds = time % 60
                return String(format: "%02d:%02d", minutes, seconds)
            }
            
            let leaders = formattedTimes.map { LeaderModel(time: "Time \($0)") }
            
            return leaders
        } else {
            return nil
        }
    }
}
