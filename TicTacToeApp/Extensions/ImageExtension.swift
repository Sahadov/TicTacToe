//
//  ImageExtension.swift
//  TicTacToeApp
//
//  Created by Alexander Bokhulenkov on 02.10.2024.
//

import UIKit

extension UIImage {
    struct CustomImage {
        static let burger = UIImage(named: "Burger")?.withAccessibilityIdentifier("Burger")
        static let cross = UIImage(named: "Cross")?.withAccessibilityIdentifier("cross")
        static let crossWithBg = UIImage(named: "CrossWithBg")?.withAccessibilityIdentifier("CrossWithBg")
        static let crossYelow = UIImage(named: "CrossYelow")?.withAccessibilityIdentifier("CrossYelow")
        static let frenchFries = UIImage(named: "FrenchFries")?.withAccessibilityIdentifier("FrenchFries")
        static let heart = UIImage(named: "Heart")?.withAccessibilityIdentifier("Heart")
        static let iceCream = UIImage(named: "IceCream")?.withAccessibilityIdentifier("IceCream")
        static let nought = UIImage(named: "Nought")?.withAccessibilityIdentifier("Nought")
        static let noughtGreen = UIImage(named: "NoughtGreen")?.withAccessibilityIdentifier("NoughtGreen")
        static let noughtWithBg = UIImage(named: "NoughtWithBg")?.withAccessibilityIdentifier("NoughtWithBg")
        static let pie = UIImage(named: "Pie")?.withAccessibilityIdentifier("Pie")
        static let star = UIImage(named: "Star")?.withAccessibilityIdentifier("Star")
    }
}



extension UIImage {
    func withAccessibilityIdentifier(_ identifier: String) -> UIImage {
        self.accessibilityIdentifier = identifier
        return self
    }
}
