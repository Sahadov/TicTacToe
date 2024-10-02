import UIKit

class SelectGameView: UIView {
    
    //MARK: - Properties
    private let containerView = UIView.makeContainerView()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.text = "Select Game"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return title
    }()
    
    let singlePlayerButton: UIButton = {
        let button = UIButton.makeCustomButtonWithImage(with: "Single Player", color: .gray, imageName: .singlePlayer)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let twoPlayersButton: UIButton = {
        let button = UIButton.makeCustomButtonWithImage(with: "Two Players", color: .gray, imageName: .twoPlayers)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let leaderboardButton: UIButton = {
        let button = UIButton.makeCustomButtonWithImage(with: "Leaderboard", color: .gray, imageName: .leaderboard)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    private func setupViews() {
        backgroundColor = UIColor(red: 245 / 255, green: 247 / 255, blue: 255 / 255, alpha: 1)
        
        addSubview(containerView)
        
        [titleLabel, singlePlayerButton, twoPlayersButton, leaderboardButton].forEach { containerView.addSubview($0) }
    }
    
    func setupNavigationBar(for viewController: UIViewController, target: AnyObject, action: Selector) {
        let settingButton = UIBarButtonItem(image: UIImage(named: "Setting"), style: .done, target: target, action: action)
        settingButton.tintColor = UIColor(red: 39 / 255, green: 37 / 255, blue: 65 / 255, alpha: 1)
        settingButton.title = "Setting"
        viewController.navigationItem.rightBarButtonItem = settingButton
        
        viewController.navigationItem.hidesBackButton = true
    }
}

private extension SelectGameView {
    func setConstraints() {
        let paddingContainerView: CGFloat = 20
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 285),
            containerView.heightAnchor.constraint(equalToConstant: 336),
            
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
            twoPlayersButton.heightAnchor.constraint(equalToConstant: 69),
            
            leaderboardButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingContainerView),
            leaderboardButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingContainerView),
            leaderboardButton.topAnchor.constraint(equalTo: twoPlayersButton.bottomAnchor, constant: paddingContainerView),
            leaderboardButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -paddingContainerView),
            leaderboardButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
}
