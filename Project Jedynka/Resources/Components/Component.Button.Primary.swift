//
//  Component.Button.Primary.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI

extension Component.Button { struct Primary: View {
    let text: String
    let action: () -> ()


    var body: some View {
        SwiftUI.Button(action: action) {
            Text(text)
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}}

// MARK: - PrimaryButtonStyle
fileprivate struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.semiBold(18))
            .foregroundStyle(.onBackground)
            .kerning(-0.5)
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(Color.accent)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }
}
