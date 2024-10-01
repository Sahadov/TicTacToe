import UIKit

final class RuleView: UIView {
    
    private lazy var numView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "PurpleLight")
        view.layer.cornerRadius = 22
        return view
    }()
    
    private lazy var numLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.font = .systemFont(ofSize: 20, weight: .regular)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(numView)
        numView.addSubview(numLabel)
        addSubview(textView)
        textView.addSubview(textLabel)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            numView.topAnchor.constraint(equalTo: topAnchor),
            numView.leadingAnchor.constraint(equalTo: leadingAnchor),
            numView.heightAnchor.constraint(equalToConstant: 45),
            numView.widthAnchor.constraint(equalToConstant: 45),
            
            numLabel.centerXAnchor.constraint(equalTo: numView.centerXAnchor),
            numLabel.centerYAnchor.constraint(equalTo: numView.centerYAnchor),
            
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leadingAnchor.constraint(equalTo: numView.trailingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            textLabel.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: textView.centerYAnchor),
        ])
    }
    
    func setValues(_ num: String, _ text: String) {
        numLabel.text = num
        textLabel.text = text
    }
}
