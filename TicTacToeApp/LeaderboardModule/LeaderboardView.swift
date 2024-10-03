import UIKit

class LeaderboardView: UIView {
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Leaderboard"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let noHistoryStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 10
        return view
    }()
    
    private let noHistoryMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No game history with turn on time"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let noHistoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "HistoryRobot")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Properties
    
    let leaders = LeaderModel.getLeaders()
    
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegates()
        setupViews()
        setConstraints()
        if leaders.count != 0 {
            noHistoryStackView.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    private func setupViews() {
        backgroundColor = UIColor(named: "BlueBg")
        addSubview(titleLabel)
        
        tableView.backgroundColor = UIColor(named: "BlueBg")
        tableView.separatorStyle = .none
        tableView.register(LeaderCell.self, forCellReuseIdentifier: "id")
        addSubview(tableView)
        
        addSubview(noHistoryStackView)
        noHistoryStackView.addArrangedSubview(noHistoryMessageLabel)
        noHistoryStackView.addArrangedSubview(noHistoryImageView)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension LeaderboardView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! LeaderCell
        
        let model = leaders[indexPath.row]
        cell.numberLeaderLabel.text = String(indexPath.row + 1)
        cell.timeLeaderLabel.text = model.time
        return cell
    }
    
    
}

// MARK: - Set Constraints

private extension LeaderboardView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 66),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            
            noHistoryStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noHistoryStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            noHistoryStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
}
