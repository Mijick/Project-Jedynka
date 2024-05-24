//
//  AppMain.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI
import MijickNavigationView

@main struct AppMain: App {
    var body: some Scene {
        WindowGroup { 
            HomeView()
                .implementNavigationView(config: navigationViewConfig)
                .preferredColorScheme(.dark)
        }
    }
}
private extension App {
    var navigationViewConfig: NavigationGlobalConfig {
        var config = NavigationGlobalConfig()
        config.backgroundColour = .background
        return config
    }
}
