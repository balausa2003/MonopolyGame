//
//  SceneDelegate.swift
//  MonopolyPlay
//
//  Created by Балауса Косжанова on 19.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions:
               UIScene .ConnectionOptions) {
        guard let windowScene = (scene as?
                                 UIWindowScene) else { return }
        window = UIWindow(frame:
                            windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: HelloViewController())
        window?.makeKeyAndVisible()
    }

   
}

