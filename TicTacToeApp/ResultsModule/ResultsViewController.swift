import UIKit

class ResultsViewController: UIViewController {
    
    var gameResult: GameResult? {
        didSet {
            guard let gameResult = gameResult else { fatalError() }
            resultView.configure(result: gameResult)
        }
    }
    
    private lazy var resultView: ResultView = {
        let view = ResultView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BlueBg")
        
        setupView()
        gameResult = .draw
    }
    
    private func setupView() {
        view.addSubview(resultView)
        
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if let result = gameResult {
            resultView.configure(result: result)
        }
    }
}
