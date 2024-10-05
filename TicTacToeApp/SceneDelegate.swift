//
//  SceneDelegate.swift
//  TicTacToeApp
//
//  Created by Дмитрий Волков on 29.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let startVC = OnboardingViewController()
        //let startVC =  GameViewController()
        window?.rootViewController = UINavigationController(rootViewController: startVC)
        window?.makeKeyAndVisible()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        MusicManager.shared.pauseBackgroundMusic()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        MusicManager.shared.resumeBackgroundMusic()
    }
}

