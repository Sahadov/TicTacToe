import UIKit

class SelectGameViewController: UIViewController {
    
    //MARK: - Properties
    private let containerView: UIView = {
        let view = UIView.makeContainerView()
        return view
    }()
    
    private let stackContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.text = "Select Game"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return title
    }()
    
    private let singlePlayerButton: UIButton = {
        let button = UIButton.makeCustomButtonWithImage(with: "Single Player", color: .gray, imageName: .singlePlayer)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let twoPlayersButton: UIButton = {
        let button = UIButton.makeCustomButtonWithImage(with: "Two Players", color: .gray, imageName: .twoPlayers)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setViews()
        setConstraints()
    }

    //MARK: - Setup UI
    private func setupNavigationBar() {
        let settingButton = UIBarButtonItem(image: UIImage(named: "Setting"), style: .done, target: self, action: #selector(barButtonTapped))
        settingButton.tintColor = UIColor(red: 39 / 255, green: 37 / 255, blue: 65 / 255, alpha: 1)
        settingButton.title = "Setting"
        navigationItem.rightBarButtonItem = settingButton
        
        navigationItem.hidesBackButton = true
    }
    
    private func setViews() {
        view.backgroundColor = UIColor(red: 245 / 255, green: 247 / 255, blue: 255 / 255, alpha: 1)
        
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(singlePlayerButton)
        containerView.addSubview(twoPlayersButton)
    }
    
    //MARK: - Methods
    @objc private func barButtonTapped() {
        let destinationVC = SettingsViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}

private extension SelectGameViewController {
    func setConstraints() {
        let paddingContainerView: CGFloat = 20
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 285),
            containerView.heightAnchor.constraint(equalToConstant: 247),
            
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: paddingContainerView),
            
            singlePlayerButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            singlePlayerButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            singlePlayerButton.heightAnchor.constraint(equalToConstant: 69),

            twoPlayersButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            twoPlayersButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            twoPlayersButton.topAnchor.constraint(equalTo: singlePlayerButton.bottomAnchor, constant: paddingContainerView),
            twoPlayersButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -paddingContainerView),
            twoPlayersButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
}

