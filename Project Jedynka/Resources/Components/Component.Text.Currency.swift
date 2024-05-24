//
//  Component.Text.Currency.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI

extension Component.Text { struct Currency: View {
    let amount: Double

    var body: some View {
        Text("$ \(wholeAmount)")
            .font(.bold(40))
            .foregroundStyle(.onBackground)
            .kerning(-1.5)
        +
        Text(".\(fractionAmount)")
            .font(.bold(24))
            .foregroundStyle(.onBackground)
            .kerning(-1.5)
    }
}}
private extension Component.Text.Currency {
    var wholeAmount: String { amountComponents[0] }
    var fractionAmount: String { String(format: "%02d", Int(amountComponents[1]) ?? 0) }
    var amountComponents: [String] { String(amount).components(separatedBy: ".") }
}
