//
//  GameViewController.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//

import UIKit

class GameViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let gameView = GameView()
    private let resultView = ResultView()
    private var gameField: [Field?] = .init(repeating: nil, count: 9)
    private var isSelected = true
    private let gameLogic = PCGameLogic()
    private let storageManager = StorageManager()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.CustomColors.backgroundBlue
        gameView.setDelegate(self)
        gameView.delegate = self
    }
    
    private func newGame() {
        gameField = .init(repeating: nil, count: 9)
        gameView.fieldCollection.reloadData()
    }
    
    //     таймер
    private var timer: Timer?
    private var totalTime = 120
    private var secondsLeft: Int = 120 {
        didSet {
            gameView.timeLabel.text = formatTime(secondsLeft)
        }
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        gameView.timeLabel.isHidden = false
        secondsLeft = totalTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if secondsLeft > 0 {
            secondsLeft -= 1
        } else {
            stopTimer()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        gameView.timeLabel.isHidden = true
        timer = nil
    }
    
    private func showResults(_ result: GameResult) {
        let destinationVC = ResultsViewController()
        destinationVC.gameResult = result
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

// MARK: - Extensions CollectionView Delegate and DataSource

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameField.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        
        
        if let namePlayer = gameField[indexPath.row]?.playerLogo {
                    let keyName = "\(namePlayer.lowercased())ImageName"
                    let currentImage = storageManager.getString(forKey: StorageManager.Keys(rawValue: keyName)!)
                    let imageSquare = UIImage(named: currentImage!)
                    cell.configure(image: imageSquare)
                } else {
                    cell.configure(image: nil)
        }
        
        
        
        cell.backgroundColor = UIColor.CustomColors.backgroundBlue
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    // MARK: - выбор ячейки по тапу
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Запускаем таймер только один раз при первом нажатии
        if timer == nil {
            startTimer()
        }
        
        // проверяем свободен ли квадрат
        if gameLogic.isSquareOccupied(in: gameField, forIndex: indexPath.row) { return }
        
        let player: Player = .cross
        
        //gameView.updatePlayerImage(to: UIImage.CustomImage.cross)
        gameView.updatePlayerImage(to: UIImage(named: storageManager.getString(forKey: .crossImageName)!))
        
        gameView.selectPlayerLabel.text = "You turn"
        
        
        gameField[indexPath.row] = Field(player: player, fieldIndex: indexPath.row)
        
        if gameLogic.checkWin(for: player, in: gameField) {
            showResults(GameResult.win)
            let timePassed = totalTime - secondsLeft
            storageManager.set(timePassed, forKey: .leaderboard)
            stopTimer()
            return
        }
        if gameLogic.checkForDraw(in: gameField) {
            showResults(GameResult.draw)
            stopTimer()
            return
        }
        
        collectionView.reloadItems(at: [indexPath])
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            //gameView.updatePlayerImage(to: UIImage.CustomImage.nought)
            gameView.updatePlayerImage(to: UIImage(named: storageManager.getString(forKey: .noughtImageName)!))
            gameView.selectPlayerLabel.text = "Computer turn"
            let computerPosition = self.gameLogic.computerMove(gameField: self.gameField)
            self.gameField[computerPosition] = Field(player: .nought, fieldIndex: computerPosition)
            
            if self.gameLogic.checkWin(for: .nought, in: self.gameField) {
                showResults(GameResult.lose)
                let timePassed = totalTime - secondsLeft
                storageManager.set(timePassed, forKey: .leaderboard)
                stopTimer()
                return
            }
            
            collectionView.reloadItems(at: [IndexPath(item: computerPosition, section: 0)])
        }
    }
}

// MARK: - Extensions CollectionViewDelegateFlowLayout

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
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

// MARK: - Extensions GameViewDelegate
extension GameViewController: GameViewDelegate {
    func firstPlayer(isSelected: Bool) {
        self.isSelected = isSelected
    }
}
