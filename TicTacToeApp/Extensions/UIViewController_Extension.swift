//
//  UIViewController_Extension.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 02.10.2024.
//

import UIKit

extension UIViewController {
    
    /// Sets a custom back button with an image and no text in the navigation bar.
    func setCustomBackButton(imageName: String, selector: Selector? = nil) {
        // Create the custom back button with the specified image
        let backButtonImage = UIImage(named: imageName)
        let customBackButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: selector ?? #selector(defaultBackButtonAction))
        
        // Hide the default back button
        navigationItem.hidesBackButton = true
        
        // Set the custom back button
        navigationItem.leftBarButtonItem = customBackButton
        
        // Hide the back button title from the previous view controller
        navigationItem.backButtonTitle = ""
    }
    
    /// Default action to pop the view controller when the custom back button is tapped.
    @objc private func defaultBackButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
