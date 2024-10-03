import Foundation

struct LeaderModel {
    let time: String
}

extension LeaderModel {
    static func getLeaders() -> [LeaderModel] {
        
        return [
            LeaderModel(time: "Best time 00:20"),
            LeaderModel(time: "Time 00:40"),
            LeaderModel(time: "Time 00:42"),
            LeaderModel(time: "Time 00:48")
        ]
    }
}
