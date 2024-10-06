import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: - Properties
    let onboardingView = OnboardingView()
    
    //MARK: - Life cycle
    override func loadView() {
        view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.setupNavigationBar(for: self)
        setupButton()
        setupDefaultSettings()
    }
    
    //MARK: - Methods
    private func setupButton() {
        onboardingView.letsPlayButton.addTarget(self, action: #selector(letsPlayButtonTapped), for: .touchUpInside)
    }
    
    
    func clearUserDefaults() {
        let defaults = UserDefaults.standard
        if let appDomain = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: appDomain)
            defaults.synchronize()
        }
        print("UserDefaults очищен.")
    }
    
    private func setupDefaultSettings() {
        let storageManager = StorageManager()
        storageManager.set(false, forKey: .gameTimeSwitch)
        storageManager.set("Cross", forKey: .crossImageName)
        storageManager.set("Nought", forKey: .noughtImageName)
    }
    
    @objc func barButtonTapped(sender: UIBarButtonItem) {
        guard let title = sender.title else { return }
        
        let destinationVC: UIViewController

        if title == "Setting" {
            destinationVC = GameSettingsViewController()
        } else if title == "Question" {
            destinationVC = RulesViewController()
        } else { return }

        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @objc private func letsPlayButtonTapped() {
        let destinationVC = SelectGameViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
