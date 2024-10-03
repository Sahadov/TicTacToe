import UIKit

class LeaderCell: UITableViewCell {
    
    private lazy var numberLeaderView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: "PurpleLight")
        element.layer.cornerRadius = 34.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var numberLeaderLabel: UILabel = {
        let element = UILabel()
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var timeLeaderView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: "PurpleLight")
        element.layer.cornerRadius = 34.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var timeLeaderLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Views
    
    private func setViews() {
        backgroundColor = UIColor(named: "BlueBg")
        addSubview(numberLeaderView)
        addSubview(timeLeaderView)
        numberLeaderView.addSubview(numberLeaderLabel)
        timeLeaderView.addSubview(timeLeaderLabel)
    }
}

// MARK: - Setup Constraints

extension LeaderCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            numberLeaderView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            numberLeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            numberLeaderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            numberLeaderView.trailingAnchor.constraint(equalTo: timeLeaderView.leadingAnchor, constant: -10),
            numberLeaderView.widthAnchor.constraint(equalToConstant: 69),
            numberLeaderView.heightAnchor.constraint(equalToConstant: 69),
            
            numberLeaderLabel.centerYAnchor.constraint(equalTo: numberLeaderView.centerYAnchor),
            numberLeaderLabel.centerXAnchor.constraint(equalTo: numberLeaderView.centerXAnchor),
            
            timeLeaderView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            timeLeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            timeLeaderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            timeLeaderLabel.centerYAnchor.constraint(equalTo: timeLeaderView.centerYAnchor),
            timeLeaderLabel.leadingAnchor.constraint(equalTo: timeLeaderView.leadingAnchor, constant: 35)
            ])
    }
    
}

