//
//  SceneDelegate.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        let store = ReposStore(service: .init())
        let searchView = SearchView().environmentObject(store)
        
        let episodesView = EpisodesView(player: PodcastPlayer(), episodes: [])
        
        let settings = SettingStore()
        let settingView = SettingView().environmentObject(settings)
        
        let personView = PersonsView(store: PersonStore())
        
        let gestureView = GestureView()
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: gestureView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

