import UIKit

class ResultsViewController: UIViewController {

    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Player One win!"
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Win")
        return imageView
    }()
    
    private lazy var againButton = UIButton.makeCustomButton(with: "Play again", color: .blue)
    private lazy var backButton = UIButton.makeCustomButton(with: "Back", color: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BlueBg")
        
        addSubViews()
        applyConstraints()
    }

    private func addSubViews() {
        view.addSubview(resultLabel)
        view.addSubview(imageView)
        view.addSubview(againButton)
        view.addSubview(backButton)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 204),
            imageView.widthAnchor.constraint(equalToConstant: 228),
            imageView.heightAnchor.constraint(equalToConstant: 228),
            
            againButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 160),
            againButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            againButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            againButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -102),
            
            backButton.topAnchor.constraint(equalTo: againButton.bottomAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: againButton.leadingAnchor),
            backButton.trailingAnchor.constraint(equalTo: againButton.trailingAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
        ])
    }
    
    private func didGetResult(_ result: String) {
        switch result {
        case "Win":
            resultLabel.text = "Player One Win!"
            imageView.image = UIImage(named: "Win")
        case "Lose":
            resultLabel.text = "You Lose!"
            imageView.image = UIImage(named: "Lose")
        default:
            resultLabel.text = "Draw!"
            imageView.image = UIImage(named: "Draw")
        }
    }
}
