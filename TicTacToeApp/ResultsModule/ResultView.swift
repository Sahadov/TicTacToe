import UIKit

protocol ResultViewDelegate: AnyObject {
    func didTapBackButton()
}

class ResultView: UIView {
    
    weak var delegate: ResultViewDelegate?
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var againButton = UIButton.makeCustomButton(with: "Play again", color: .blue)
    private lazy var backButton = UIButton.makeCustomButton(with: "Back", color: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(result: GameResult) {
        resultLabel.text = result.message
        imageView.image = UIImage(named: result.imageName)
    }
    
    private func setupViews() {
        [resultLabel, imageView, againButton, backButton].forEach { addSubview($0) }
        
        againButton.addTarget(self, action: #selector(didTapAgainButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 204),
            imageView.widthAnchor.constraint(equalToConstant: 228),
            imageView.heightAnchor.constraint(equalToConstant: 228),
            
            againButton.heightAnchor.constraint(equalTo: backButton.heightAnchor),
            againButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            againButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            againButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -12),
            
            backButton.heightAnchor.constraint(equalToConstant: 72),
            backButton.leadingAnchor.constraint(equalTo: againButton.leadingAnchor),
            backButton.trailingAnchor.constraint(equalTo: againButton.trailingAnchor),
            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -18),
        ])
    }
    
    @objc private func didTapAgainButton() {
        
    }
    
    @objc private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
}
