//
//  TwoPlayerGameViewController.swift
//  TicTacToeApp
//
//  Created by Bakgeldi Alkhabay on 03.10.2024.
//

import UIKit

class TwoPlayerGameViewController: BaseViewController {
    
    // MARK: - Properties
    
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
        gameView.selectPlayerImage.image = currentPlayer == .cross ? UIImage.CustomImage.cross : UIImage.CustomImage.nought
    }

    private func showWinner(_ winner: Player) {
        stopTimer()
        switch winner {
        case .cross:
            showResults(.win)
        case .nought:
            showResults(.lose)
        }
    }
    
    private func showResults(_ result: GameResult) {
        let destinationVC = ResultsViewController()
        destinationVC.gameResult = result
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    // MARK: - Timer Functions
    private func startTimer() {
        secondsLeft = totalTime // Установить оставшееся время
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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
            cell.configure(with: player == .cross ? UIImage.CustomImage.cross : UIImage.CustomImage.nought)
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
