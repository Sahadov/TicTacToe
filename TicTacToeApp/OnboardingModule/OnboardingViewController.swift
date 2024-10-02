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
    }
    
    //MARK: - Methods
    private func setupButton() {
        onboardingView.letsPlayButton.addTarget(self, action: #selector(letsPlayButtonTapped), for: .touchUpInside)
    }
    
    @objc func barButtonTapped(sender: UIBarButtonItem) {
        guard let title = sender.title else { return }
        
        let destinationVC: UIViewController

        if title == "Setting" {
            destinationVC = SettingsViewController()
        } else if title == "Question" {
            //change to RulesViewController
            destinationVC = SettingsViewController()
        } else { return }

        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @objc private func letsPlayButtonTapped() {
        let destinationVC = SelectGameViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
