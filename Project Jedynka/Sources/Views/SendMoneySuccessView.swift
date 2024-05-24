//
//  SendMoneySuccessView.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI
import MijickNavigationView

struct SendMoneySuccessView: NavigatableView {
    var body: some View {
        ZStack {
            createConfirmationView()
            createCloseButton()
        }
        .padding(.horizontal, .marginValue)
    }
}
private extension SendMoneySuccessView {
    func createConfirmationView() -> some View {
        ConfirmationView()
    }
    func createCloseButton() -> some View {
        CloseButton()
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 8)
    }
}


// MARK: - ConfirmationView
fileprivate struct ConfirmationView: View {
    var body: some View {
        VStack(spacing: 0) {
            createSuccessIcon()
            Spacer().frame(height: 36)
            createAmountText()
            Spacer().frame(height: 8)
            createConfirmationText()
        }
    }
}
private extension ConfirmationView {
    func createSuccessIcon() -> some View {
        Image(.check)
            .resizable()
            .foregroundStyle(Color.background)
            .frame(width: 60, height: 60)
            .frame(width: 84, height: 84)
            .background(Color.onBackground)
            .mask(Circle())
    }
    func createAmountText() -> some View {
        Component.Text.Currency(amount: 2137.14)
    }
    func createConfirmationText() -> some View {
        Text("has been sent to Hymel Jadwiga")
            .font(.regular(16))
            .foregroundStyle(.onBackground75)
            .kerning(0.15)
    }
}

// MARK: - CloseButton
fileprivate struct CloseButton: View {
    var body: some View { 
        Component.Button.Primary(text: "Close", action: onTap)
    }
}
private extension CloseButton {
    func onTap() {
        popToRoot()
    }
}


// MARK: - Preview
#Preview {
    SendMoneySuccessView()
}
