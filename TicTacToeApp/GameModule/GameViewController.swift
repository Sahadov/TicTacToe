//
//  GameViewController.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//

import UIKit

class GameViewController: BaseViewController {
    
    enum Player {
        case first
        case second
    }
    
    struct Field {
        let player: Player
        let fieldIndex: Int
        var playerLogo: String {
            return player == .first ? "Cross" : "Nought"
        }
    }
    
    private var gameField: [Field?] = .init(repeating: nil, count: 9)
    private var isSelected = true
    
    
//    проверка поля на свободную ячейку
    private func isSquareOccupied(in field: [Field?], forIndex index: Int ) -> Bool {
        return field.contains { $0?.fieldIndex == index }
    }
    
    
//    проверка на выигрыш
    private func checkWin(for player: Player?, in field: [Field?]) -> Bool {
        let winPaterns: Set<Set<Int>> = [ [0,1,2], [3,4,5], [6,7,8],
                                          [0,3,6], [1,4,7], [2,5,8],
                                          [0,4,8], [2,4,6]]
        let playerMoves = field.compactMap { $0 }.filter { $0.player
         == player}
        let playerPositions = Set(playerMoves.map { $0.fieldIndex })
        for patern in winPaterns where patern.isSubset(of: playerPositions) {
            return true
        }
        return false
    }
    
    private func checkForDraw(in field: [Field?]) -> Bool {
        return field.compactMap{$0}.count == gameField.count
    }
    
    private func newGame() {
        gameField = .init(repeating: nil, count: 9)
        gameView.fieldCollection.reloadData()
    }
    
    
    private func showAlert(playerWin: Player) {
        
        var player: String { playerWin == .first ? "You is win" : "Computer is win!" }
        
        let alert = UIAlertController(title: "Game Over", message: player, preferredStyle: .alert)
        
        let newGameAction = UIAlertAction(title: "New Game", style: .default) {_ in
            self.newGame()
        }
        
        alert.addAction(newGameAction)
        present(alert, animated: true, completion: nil)
    }
    private func showAlert() {
        
        
        
        let alert = UIAlertController(title: "Game Over", message: "Game is Draw", preferredStyle: .alert)
        
        let newGameAction = UIAlertAction(title: "New Game", style: .default) {_ in
            self.newGame()
        }
        
        alert.addAction(newGameAction)
        present(alert, animated: true, completion: nil)
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
            timer = nil
        }

//    компьютерная игра
    private func computerMove(gameField: [Field?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        while isSquareOccupied(in: gameField, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    // MARK: - Properties
    
    private let gameView = GameView()

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
}

// MARK: - Extensions CollectionView Delegate and DataSource

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameField.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        
        
        if let namePlayer = gameField[indexPath.row]?.playerLogo {
            let imageSquare = UIImage(named: namePlayer)
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
        
        startTimer()
        
        // проверяем свободен ли квадрат
        if isSquareOccupied(in: gameField, forIndex: indexPath.row) { return }
      
        /*
         для 2 игроков
        let player: Player = isSelected ? .first : .second
        
        gameField[indexPath.row] = Field(player: player, fieldIndex: indexPath.row)
        
        isSelected.toggle()
         */
        
        let player: Player = .first
        
        gameView.selectPlayerLabel.text = "You turn"
       
        
        gameField[indexPath.row] = Field(player: player, fieldIndex: indexPath.row)
        
        if checkWin(for: player, in: gameField) {
            
            showAlert(playerWin: player)
            return
        }
        if checkForDraw(in: gameField) {
            showAlert()
            return
        }
        
        collectionView.reloadItems(at: [indexPath])

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            gameView.selectPlayerLabel.text = "Computer turn"
            let computerPosition = self.computerMove(gameField: self.gameField)
            self.gameField[computerPosition] = Field(player: .second, fieldIndex: computerPosition)
            
            if self.checkWin(for: .second, in: self.gameField) {
                    print("\(Player.second) win")
                    self.showAlert(playerWin: .second)
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
