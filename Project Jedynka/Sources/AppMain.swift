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
import MijickPopupView

@main struct AppMain: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().preferredColorScheme(.dark)
            }
            .implementPopupView()
        }
    }
}
