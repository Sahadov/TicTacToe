import UIKit

class SelectGameViewController: UIViewController {
    
    //MARK: - Properties
    let selectGameView = SelectGameView()

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
        let destinationVC = SettingsViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @objc private func buttonsTapped(sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        
        let destinationVC: UIViewController
        
        switch title {
        case "Single Player":
            destinationVC = GameViewController()
        case "Two Players":
            destinationVC = TwoPlayerGameViewController()
        case "Leaderboard":
            //change to LeaderboardViewController
            destinationVC = UIViewController()
        default:
            destinationVC = UIViewController()
        }
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}
