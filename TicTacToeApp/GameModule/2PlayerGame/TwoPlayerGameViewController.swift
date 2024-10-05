//
//  TwoPlayerGameViewController.swift
//  TicTacToeApp
//
//  Created by Bakgeldi Alkhabay on 03.10.2024.
//

import UIKit

class TwoPlayerGameViewController: BaseViewController {
    
    // MARK: - Properties
    private let storageManager = StorageManager()
    
    private let cellCount = 9
    private let gameView = TwoPlayerGameView()
    private let gameLogic = TwoPlayerGameLogic()
    
    private var timer: Timer?
    private var totalTime = 120
    private var secondsLeft: Int = 120 {
        didSet {
            gameView.timeLabel.text = formatTime(secondsLeft)
        }
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.CustomColors.backgroundBlue
        gameView.setDelegate(self)
        gameView.fieldCollection.register(TwoPlayerGameCollectionViewCell.self, forCellWithReuseIdentifier: TwoPlayerGameCollectionViewCell.identifier)
        
        // отображаем время
        gameView.timeLabel.text = formatTime(secondsLeft)
        
        checkGameTimerSwitcher()
        startTimer()
    }
    
    // MARK: - Game Logic
    private func handleCellTap(at index: Int) {
        if let winner = gameLogic.makeMove(at: index) {
            showWinner(winner)
        } else if gameLogic.moveCount == 9 {
            showResults(.draw)
        } else {
            gameView.fieldCollection.reloadData()
            updateSelectedPlayerImage()
        }
    }
    
    private func updateSelectedPlayerImage() {
        let currentPlayer = gameLogic.getCurrentPlayer()
        guard let crossImage = storageManager.getString(forKey: .crossImageName) else { return }
        guard let noughtImage = storageManager.getString(forKey: .noughtImageName) else { return }
        gameView.selectPlayerImage.image = currentPlayer == .cross ? UIImage(named: crossImage) : UIImage(named: noughtImage)
        gameView.selectPlayerLabel.text = currentPlayer == .cross ? "Player 1 turn" : "Player 2 turn"
    }

    private func showWinner(_ winner: Player) {
        stopTimer()
        switch winner {
        case .cross:
            showResults(.win)
            let timePassed = totalTime - secondsLeft
            storageManager.set(timePassed, forKey: .leaderboard)
        case .nought:
            showResults(.lose)
            let timePassed = totalTime - secondsLeft
            storageManager.set(timePassed, forKey: .leaderboard)
        }
    }
    
    private func showResults(_ result: GameResult) {
        let destinationVC = ResultsViewController()
        destinationVC.gameResult = result
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    // MARK: - Timer Functions
    private func checkGameTimerSwitcher() {
        guard let timerOn = storageManager.getBool(forKey: .gameTimeSwitch) else { return }
        guard let duration = storageManager.getInt(forKey: .duration) else { return }
        if timerOn {
            gameView.timeLabel.isHidden = false
            totalTime = duration
            
            startTimer()
        } else {
            gameView.timeLabel.isHidden = true
        }
    }
    
    private func startTimer() {
        secondsLeft = totalTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        print("Таймер запущен с общим временем: \(totalTime)") //не выводит принт

    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateTimer() {
        if secondsLeft > 0 {
            secondsLeft -= 1
        } else {
            showResults(.draw)
            stopTimer()
        }
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// MARK: - Extensions CollectionView Delegate and DataSource

extension TwoPlayerGameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TwoPlayerGameCollectionViewCell.identifier, for: indexPath) as! TwoPlayerGameCollectionViewCell
        
        if let player = gameLogic.board[indexPath.item] {
            guard let crossImage = storageManager.getString(forKey: .crossImageName) else { return UICollectionViewCell() }
            guard let noughtImage = storageManager.getString(forKey: .noughtImageName) else { return UICollectionViewCell() }
            cell.configure(with: player == .cross ? UIImage(named: crossImage) : UIImage(named: noughtImage))
        } else {
            cell.configure(with: nil)
        }
        
        cell.backgroundColor = UIColor.CustomColors.backgroundBlue
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCellTap(at: indexPath.item)
    }
}

// MARK: - Extensions CollectionViewDelegateFlowLayout

extension TwoPlayerGameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame: CGRect = collectionView.frame
        var measuredWidth = collectionViewFrame.width
        measuredWidth = (measuredWidth/3) - (20.0/3)
        let measuredHeight = collectionView.frame.width/3
        return CGSize(width: measuredWidth, height: measuredHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
}
