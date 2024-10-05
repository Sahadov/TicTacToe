//
//  GameTimeView.swift
//  TicTacToeApp
//
//  Created by user on 04.10.2024.
//



import UIKit

final class GameTimeView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Private Property
    
    private let customView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.layer.cornerRadius = 24
        customView.backgroundColor = UIColor.CustomColors.backgroundBlue
        return customView
    }()
    
    private let gameTimeSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.onTintColor = UIColor.CustomColors.blue
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    
    private let gameTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Game Time"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Таблица для отображения вариантов времени
    private let durationTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 15
        tableView.backgroundColor = UIColor.CustomColors.backgroundBlue
        return tableView
    }()
    
    private let musicView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.layer.cornerRadius = 24
        customView.backgroundColor = UIColor.CustomColors.backgroundBlue
        return customView
    }()
    
    let musicLabel: UILabel = {
        let label = UILabel()
        label.text = "Music"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var musicSwitch: UISwitch = {
        let toggle = UISwitch()
        //toggle.isOn = false
        toggle.onTintColor = UIColor.CustomColors.blue
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    private let duration = ["30 min", "60 min", "120 min"]
    private let storageManager = StorageManager()
    
    // Выбранный вариант
    var selectedIndexPath: IndexPath?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        durationTableView.delegate = self
        durationTableView.dataSource = self
        durationTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        addSubview(customView)
        
        addSubview(durationTableView)
        
        addSubview(musicView)
        
        setupLayout()
        setupConstraints()
        setupSwitchTime()
        setupSwitch()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - SetupLayout
    
    private func setupLayout() {
        [ gameTimeLabel, gameTimeSwitch].forEach { subView in
            customView.addSubview(subView)
        }
        
        [musicLabel, musicSwitch].forEach { musicView.addSubview($0) }
    }
    
    //MARK: - Private Methods
    
    private func setupSwitchTime() {
        if let timeOn = storageManager.getBool(forKey: .gameTimeSwitch) {
            gameTimeSwitch.isOn = timeOn
        } else {
            gameTimeSwitch.isOn = false
            storageManager.set(gameTimeSwitch.isOn, forKey: .gameTimeSwitch)
        }
        
        gameTimeSwitch.addTarget(self, action: #selector(timeChanged), for: .touchUpInside)
    }
    
    private func setupSwitch() {
        let timeOn = storageManager.getBool(forKey: .gameTimeSwitch) ?? false
        gameTimeSwitch.isOn = timeOn
        
        musicSwitch.addTarget(self, action: #selector(musicChanged), for: .touchUpInside)
    }
    
    //MARK: - Methods
    
    @objc private func timeChanged(_ sender: UISwitch) {
        let isOn = sender.isOn
        storageManager.set(isOn, forKey: .gameTimeSwitch)
        print(isOn ? "Toggle is On" : "Toggle is Off")
    }
    
    
    @objc private func musicChanged(_ sender: UISwitch) {
        if sender.isOn {
            MusicManager.shared.startBackgroundMusic()
        } else {
            MusicManager.shared.stopBackgroundMusic()
        }
        storageManager.set(sender.isOn, forKey: .musicOn)
    }
    
    //MARK: - Layout
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            customView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            customView.heightAnchor.constraint(equalToConstant: 56),
            
            gameTimeLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 16),
            gameTimeLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            gameTimeSwitch.centerYAnchor.constraint(equalTo: gameTimeLabel.centerYAnchor),
            gameTimeSwitch.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
            
            durationTableView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 20),
            durationTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            durationTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            durationTableView.heightAnchor.constraint(equalToConstant: 150),
            
            musicView.topAnchor.constraint(equalTo: durationTableView.bottomAnchor, constant: 20),
            musicView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            musicView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            musicView.heightAnchor.constraint(equalToConstant: 56),
            
            musicLabel.topAnchor.constraint(equalTo: musicView.topAnchor, constant: 16),
            musicLabel.leadingAnchor.constraint(equalTo: musicView.leadingAnchor, constant: 16),
            musicSwitch.centerYAnchor.constraint(equalTo: musicLabel.centerYAnchor),
            musicSwitch.trailingAnchor.constraint(equalTo: musicView.trailingAnchor, constant: -10)
        ])
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return duration.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = duration[indexPath.row]
        
        if indexPath == selectedIndexPath {
            cell.textLabel?.textColor = UIColor.CustomColors.black
            cell.backgroundColor = UIColor.CustomColors.purple.withAlphaComponent(0.5)
        } else {
            cell.textLabel?.textColor = UIColor.CustomColors.black
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        
        let selectedDuration = duration[indexPath.row]
        
        if storageManager.getBool(forKey: .gameTimeSwitch) == true {
            storageManager.set(selectedDuration, forKey: .duration)
            print("Save \(selectedDuration)")
        } else {
            print("Toggle is Off")
        }

        tableView.reloadData()
    }
}
