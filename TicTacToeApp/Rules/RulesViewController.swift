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
    
    private lazy var textView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "BlueLight")
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Draw a grid with three rows and \nthree columns, creating nine \nsquares in total."
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var ruleView: RuleView = {
        let view = RuleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let num = "1"
        let text = "Draw a grid with three rows and \nthree columns, creating nine \nsquares in total."
        view.setValues(num, text)
        return view
    }()
    
    private lazy var ruleView2: RuleView = {
        let view = RuleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let num = "2"
        let text = "Players take turns placing their \nmarker (X or O) in an empty \nsquare. \nTo make a move, a player \nselects a number \ncorresponding to the square \nwhere they want to place their \nmarker."
        view.setValues(num, text)
        return view
    }()
    
    private lazy var ruleView3: RuleView = {
        let view = RuleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let num = "3"
        let text = "Player X starts by choosing a \nsquare (e.g., square 5). \nPlayer O follows by choosing \nan empty square (e.g., square \n1). \nContinue alternating turns until \nthe game ends."
        view.setValues(num, text)
        return view
    }()
    
    private lazy var ruleView4: RuleView = {
        let view = RuleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let num = "4"
        let text = "The first player to align three \nof their markers horizontally, \nvertically, or diagonally wins. \nExamples of Winning \nCombinations: Horizontal: \nSquares 1, 2, 3 or 4, 5, 6 or \n 7, 8, 9 \nVertical: Squares 1, 4, 7 or 2, 5, \n8 or 3, 6, 9 \nDiagonal: Squares 1, 5, 9 or \n3, 5, 7"
        view.setValues(num, text)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BlueBg")
        
        addSubViews()
        applyConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(ruleView)
        contentView.addSubview(ruleView2)
        contentView.addSubview(ruleView3)
        contentView.addSubview(ruleView4)
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
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            ruleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ruleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            ruleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            ruleView.heightAnchor.constraint(equalToConstant: 90),
            
            ruleView2.topAnchor.constraint(equalTo: ruleView.bottomAnchor, constant: 10),
            ruleView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            ruleView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            ruleView2.heightAnchor.constraint(equalToConstant: 190),
            
            ruleView3.topAnchor.constraint(equalTo: ruleView2.bottomAnchor, constant: 10),
            ruleView3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            ruleView3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            ruleView3.heightAnchor.constraint(equalToConstant: 170),
            
            ruleView4.topAnchor.constraint(equalTo: ruleView3.bottomAnchor, constant: 10),
            ruleView4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            ruleView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            ruleView4.heightAnchor.constraint(equalToConstant: 255),
            
            ruleView4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func didTapBackButton() {
        //TO-DO: Back to main page
    }
}
