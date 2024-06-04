//
//  SendMoneyView.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI

struct SendMoneyView: View {
    @Binding var isActive: Bool


    var body: some View {
        VStack(spacing: 0) {
            createNavigationBar()
            Spacer().frame(height: 52)
            createReceiverDetailsView()
            Spacer().frame(height: 52)
            createMoneyToSendView()
            Spacer()
            createSendButton()
        }
        .padding(.horizontal, .marginValue)
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            A().showAndStack()
        }
    }
}
private extension SendMoneyView {
    func createNavigationBar() -> some View {
        NavigationBar()
    }
    func createReceiverDetailsView() -> some View {
        ReceiverDetailsView()
    }
    func createMoneyToSendView() -> some View {
        MoneyToSendMoneyView()
    }
    func createSendButton() -> some View {
        SendButton(isActive: $isActive).padding(.bottom, 8)
    }
}


// MARK: - NavigationBar
fileprivate struct NavigationBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var body: some View {
        ZStack {
            createCloseButton()
            createTitleText()
        }
    }
}
private extension NavigationBar {
    func createCloseButton() -> some View {
        Button(action: onCloseButtonTap) {
            Image(.close)
                .resizable()
                .foregroundStyle(.onBackground)
                .frame(width: 28, height: 28)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createTitleText() -> some View {
        Text("Send money to")
            .font(.semiBold(17))
            .foregroundStyle(.onBackground)
            .kerning(0.25)
    }
}
private extension NavigationBar {
    func onCloseButtonTap() {
        presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - ReceiverDetailsView
fileprivate struct ReceiverDetailsView: View {
    var body: some View {
        VStack(spacing: 0) {
            createProfileImageView()
            Spacer().frame(height: 24)
            createProfileNameText()
            Spacer().frame(height: 12)
            createProfileUsernameText()
        }
    }
}
private extension ReceiverDetailsView {
    func createProfileImageView() -> some View {
        Text("JH")
            .font(.bold(20))
            .foregroundStyle(.onBackground75)
            .kerning(-0.15)
            .frame(width: 120, height: 120)
            .background(Circle().applyDefaultBackgroundAndStroke())
    }
    func createProfileNameText() -> some View {
        Text("Jadwiga Hymel")
            .font(.bold(26))
            .foregroundStyle(.onBackground)
            .kerning(0.15)
    }
    func createProfileUsernameText() -> some View {
        Text("@lipinkiluzyckielaczna43")
            .font(.regular(15))
            .foregroundStyle(.onBackground75)
            .kerning(0.15)
    }
}

// MARK: - MoneyToSendView
fileprivate struct MoneyToSendMoneyView: View {
    var body: some View {
        Component.Text.Currency(amount: 2137.14)
    }
}

// MARK: - SendButton
fileprivate struct SendButton: View {
    @Binding var isActive: Bool


    var body: some View {
        NavigationLink(destination: onTap) {
            Text("Send")
                .font(.semiBold(18))
                .foregroundStyle(.onBackground)
                .kerning(-0.5)
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(Color.accent)
                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}
private extension SendButton {
    func onTap() -> some View {
        SendMoneySuccessView(isActive: $isActive)
    }
}
