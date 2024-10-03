//
//  BaseViewController.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 02.10.2024.
//
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the custom back button in all view controllers that inherit from this class
        setCustomBackButton(imageName: "BackIcon")
    }
}
