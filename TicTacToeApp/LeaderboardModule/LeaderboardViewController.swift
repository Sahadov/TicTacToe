import UIKit

class LeaderboardViewController: BaseViewController {
    
    //MARK: - Properties
    let leaderboardView = LeaderboardView()
    
    //MARK: - Life cycle
    override func loadView() {
        view = leaderboardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
