//
//  GameTimeStack.swift
//  TicTacToeApp
//
//  Created by user on 01.10.2024.
//

import UIKit

final class GameTimeViewOld: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Private Property
    
    private let customView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.layer.cornerRadius = 24
        customView.backgroundColor = .systemGray5
        return customView
    }()
    
    //  Переключатель (switch) для Game Time
    private let gameTimeSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
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
        tableView.backgroundColor = UIColor.systemGray6
        return tableView
    }()
    
    
    // Варианты продолжительности времени
    private let durations = ["30 min", "60 min", "120 min"]
    
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
        
        setupLayout()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        [ gameTimeLabel, gameTimeSwitch].forEach { subView in
            customView.addSubview(subView)
        }
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
            durationTableView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return durations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = durations[indexPath.row]
        
        
        if indexPath == selectedIndexPath {
            cell.textLabel?.textColor = .white
            cell.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.5)
        } else {
            cell.textLabel?.textColor = .black
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        tableView.reloadData()
    }
}
