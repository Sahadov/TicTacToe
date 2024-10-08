import UIKit

class SelectGameViewController: UIViewController {
    
    //MARK: - Properties
    let selectGameView = SelectGameView()
    let storage = StorageManager()

    //MARK: - Life cycle
    override func loadView() {
        view = selectGameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    //MARK: - Methods
    
    private func setupButtons() {
        selectGameView.singlePlayerButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        selectGameView.twoPlayersButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        selectGameView.leaderboardButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        
        selectGameView.setupNavigationBar(for: self, target: self, action: #selector(barButtonTapped))
    }
    
    @objc func barButtonTapped() {
        let destinationVC = GameSettingsViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @objc private func buttonsTapped(sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        
        let destinationVC: UIViewController
        
        switch title {
        case "Single Player":
            destinationVC = GameViewController()
            storage.set("Single Player", forKey: .gameMode)
        case "Two Players":
            destinationVC = TwoPlayerGameViewController()
            storage.set("Two Players", forKey: .gameMode)
        case "Leaderboard":
            destinationVC = LeaderboardViewController()
        default:
            destinationVC = UIViewController()
        }
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}
