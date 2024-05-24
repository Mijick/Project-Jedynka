//
//  Component.Style.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: - CGFloat ++
extension CGFloat {
    static var marginValue: CGFloat { 16 }
}

// MARK: - Shape ++
extension Shape {
    func applyDefaultBackgroundAndStroke() -> some View {
        self
            .stroke(.onBackground15, lineWidth: 1)
            .fill(.onBackground10)
    }
}
