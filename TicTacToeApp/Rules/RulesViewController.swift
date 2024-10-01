import UIKit

class RulesViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "BackIcon"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How to play"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let rulesData = [
        ("1", "Draw a grid with three rows and \nthree columns, creating nine \nsquares in total."),
        ("2", "Players take turns placing their \nmarker (X or O) in an empty \nsquare. \nTo make a move, a player \nselects a number \ncorresponding to the square \nwhere they want to place their \nmarker."),
        ("3", "Player X starts by choosing a \nsquare (e.g., square 5). \nPlayer O follows by choosing \nan empty square (e.g., square \n1). \nContinue alternating turns until \nthe game ends."),
        ("4", "The first player to align three \nof their markers horizontally, \nvertically, or diagonally wins. \nExamples of Winning \nCombinations: \nHorizontal: Squares 1, 2, 3 \nor 4, 5, 6 or 7, 8, 9 \nVertical: Squares 1, 4, 7 or 2, 5, \n8 or 3, 6, 9 \nDiagonal: Squares 1, 5, 9 or \n3, 5, 7")
    ]
    
    private var ruleViews: [RuleView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BlueBg")
        
        createRuleViews()
        
        addSubViews()
        applyConstraints()
    }
    
    private func createRuleViews() {
        for (number, text) in rulesData {
            let ruleView = RuleView()
            ruleView.translatesAutoresizingMaskIntoConstraints = false
            ruleView.setValues(number, text)
            ruleViews.append(ruleView)
        }
    }
    
    private func addSubViews() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        for ruleView in ruleViews {
            contentView.addSubview(ruleView)
        }
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 66),
            
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 43),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        for (index, ruleView) in ruleViews.enumerated() {
            NSLayoutConstraint.activate([
                ruleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
                ruleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
                ruleView.heightAnchor.constraint(equalToConstant: {
                    switch index {
                    case 1:
                        return 190
                    case 2:
                        return 170
                    case 3:
                        return 255
                    default:
                        return 90
                    }
                }())
            ])
            
            if index == 0 {
                ruleView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            } else {
                ruleView.topAnchor.constraint(equalTo: ruleViews[index - 1].bottomAnchor, constant: 10).isActive = true
            }
        }
        
        if let lastRuleView = ruleViews.last {
            lastRuleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        }
    }
    
    @objc private func didTapBackButton() {
        //TO-DO: Back to main page
    }
}
