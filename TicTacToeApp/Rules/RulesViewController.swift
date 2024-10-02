import UIKit

final class RulesViewController: UIViewController {
    
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
    
    private let ruleViewFactory = RuleViewFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BlueBg")
        
        addSubViews()
        applyConstraints()
        setupRules()
    }
    
    private func addSubViews() {
        [backButton, titleLabel, scrollView].forEach { view.addSubview($0) }
        scrollView.addSubview(contentView)
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
    }
    
    private func setupRules() {
        let ruleViews = ruleViewFactory.createRuleViews(from: RuleModel.rules)
        
        for (index, ruleView) in ruleViews.enumerated() {
            contentView.addSubview(ruleView)
            NSLayoutConstraint.activate([
                ruleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
                ruleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
                ruleView.heightAnchor.constraint(equalToConstant: ruleViewFactory.height(for: index))
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
        // TO-DO: Back to main page
    }
}
