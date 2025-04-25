//
//  SceneDelegate.swift
//  Capstone
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // ✅ Load your SwiftUI TabView
        let contentView = ContentView()
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: MainTabView())

        self.window = window
        window.makeKeyAndVisible()
    }
}
