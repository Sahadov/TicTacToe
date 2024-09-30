//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let button = UIButton.makeCustomButton(with: "Button", color: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        
    }
    
    func setViews(){
        view.backgroundColor = .systemCyan
        view.addSubview(button)
    }

}

private extension OnboardingViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 72),
            button.widthAnchor.constraint(equalToConstant: 348),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

