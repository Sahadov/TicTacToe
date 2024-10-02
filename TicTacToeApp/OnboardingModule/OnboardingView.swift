import UIKit

class OnboardingView: UIView {
    
    //MARK: - Properties
    let letsPlayButton = UIButton.makeCustomButton(with: "Let's play", color: .blue)
    
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
        backgroundColor = .white
        addSubview(letsPlayButton)
        addSubview(imageContainerView)
        addSubview(titleLabel)
        imageContainerView.addSubview(firstImageView)
        imageContainerView.addSubview(secondImageView)
    }
    
    func setupNavigationBar(for viewController: UIViewController) {
        let settingButton = UIBarButtonItem(image: UIImage(named: "Setting"), style: .done, target: viewController, action: #selector(OnboardingViewController.barButtonTapped))
        settingButton.tintColor = UIColor(red: 39 / 255, green: 37 / 255, blue: 65 / 255, alpha: 1)
        settingButton.title = "Setting"
        viewController.navigationItem.rightBarButtonItem = settingButton
        
        let questionButton = UIBarButtonItem(image: UIImage(named: "Question"), style: .done, target: viewController, action: #selector(OnboardingViewController.barButtonTapped))
        questionButton.tintColor = UIColor(red: 239 / 255, green: 141 / 255, blue: 209 / 255, alpha: 1)
        questionButton.title = "Question"
        viewController.navigationItem.leftBarButtonItem = questionButton
    }
}

private extension OnboardingView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            letsPlayButton.heightAnchor.constraint(equalToConstant: 72),
            letsPlayButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            letsPlayButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            letsPlayButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -46),
            
            imageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 278),
            imageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            imageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            imageContainerView.heightAnchor.constraint(equalToConstant: 135),
            
            secondImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            secondImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor),
            secondImageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor, multiplier: 0.5),
            
            firstImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            firstImageView.trailingAnchor.constraint(equalTo: secondImageView.leadingAnchor, constant: 13),
            firstImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 24),
            firstImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 31),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

