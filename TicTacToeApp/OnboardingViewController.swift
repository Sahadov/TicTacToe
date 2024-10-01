import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: - Properties
    private let letsPlayButton = UIButton.makeCustomButton(with: "Let's play", color: .blue)
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "CrossBig")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "NoughtBig")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TIC-TAC-TOE"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    //MARK: - Life cycle
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
        
        let questionButton = UIBarButtonItem(image: UIImage(named: "Question"), style: .done, target: self, action: #selector(barButtonTapped))
        questionButton.tintColor = UIColor(red: 239 / 255, green: 141 / 255, blue: 209 / 255, alpha: 1)
        questionButton.title = "Question"
        navigationItem.leftBarButtonItem = questionButton
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(letsPlayButton)
        view.addSubview(imageContainerView)
        view.addSubview(titleLabel)
        imageContainerView.addSubview(firstImageView)
        imageContainerView.addSubview(secondImageView)
        
        letsPlayButton.addTarget(self, action: #selector(letsPlayButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - Methods
    @objc private func barButtonTapped(sender: UIBarButtonItem) {
        guard let title = sender.title else { return }
        
        let destinationVC: UIViewController
        
        if title == "Setting" {
            destinationVC = SettingsViewController()
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

private extension OnboardingViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            letsPlayButton.heightAnchor.constraint(equalToConstant: 72),
            letsPlayButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            letsPlayButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            letsPlayButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -46),
            
            imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 278),
            imageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            imageContainerView.heightAnchor.constraint(equalToConstant: 135),
            
            secondImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            secondImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor),
            secondImageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor, multiplier: 0.5),
            
            firstImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            firstImageView.trailingAnchor.constraint(equalTo: secondImageView.leadingAnchor, constant: 13),
            firstImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 24),
            firstImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 31),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

