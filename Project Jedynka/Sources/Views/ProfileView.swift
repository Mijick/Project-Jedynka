//
//  ProfileView.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            createNavigationBar()
            createScrollableView()
        }
        .padding(.horizontal, .marginValue)
        .navigationBarBackButtonHidden(true)
    }
}
private extension ProfileView {
    func createNavigationBar() -> some View {
        NavigationBar()
            .padding(.top, 12)
            .padding(.bottom, 12)
    }
    func createScrollableView() -> some View { ScrollView(showsIndicators: false) {
        VStack(spacing: 64) {
            createProfileDetailsView()
            createBottomView()
        }
        .padding(.top, 36)
        .padding(.bottom, 24)
    }}
}
private extension ProfileView {
    func createProfileDetailsView() -> some View {
        ProfileDetailsView()
    }
    func createBottomView() -> some View {
        BottomView()
    }
}


// MARK: - NavigationBar
fileprivate struct NavigationBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var body: some View {
        createCloseButton().frame(maxWidth: .infinity, alignment: .leading)
    }
}
private extension NavigationBar {
    func createCloseButton() -> some View { Button(action: { presentationMode.wrappedValue.dismiss() }) {
        Image(.close)
            .resizable()
            .foregroundStyle(.onBackground)
            .frame(width: 28, height: 28)
    }}
}

// MARK: - ProfileDetailsView
fileprivate struct ProfileDetailsView: View {
    var body: some View {
        VStack(spacing: 0) {
            createProfileImageView()
            Spacer().frame(height: 24)
            createProfileNameText()
            Spacer().frame(height: 8)
            createProfileUsernameText()
        }
    }
}
private extension ProfileDetailsView {
    func createProfileImageView() -> some View {
        Text("PJ")
            .font(.bold(32))
            .foregroundStyle(.onBackground75)
            .kerning(-1)
            .frame(width: 120, height: 120)
            .background(Circle().applyDefaultBackgroundAndStroke())
    }
    func createProfileNameText() -> some View {
        Text("Paweł Jumper")
            .font(.bold(20))
            .foregroundStyle(.onBackground)
            .kerning(0.25)
    }
    func createProfileUsernameText() -> some View {
        Text("@alajakboli2137")
            .font(.regular(15))
            .foregroundStyle(.onBackground75)
            .kerning(0.1)
    }
}

// MARK: - BottomView
fileprivate struct BottomView: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) { createItem(0); createItem(1) }
            createItem(2)
        }
    }
}
private extension BottomView {
    func createItem(_ index: Int) -> some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.onBackground15)
            .frame(height: getItemHeight(index))
            .frame(maxWidth: .infinity)
    }
}
private extension BottomView {
    func getItemHeight(_ index: Int) -> CGFloat { switch index {
        case 0, 1: 152
        default: 400
    }}
}
private extension BottomView {
    var backgroundColor: Color { .background15 }
}


// MARK: - Preview
#Preview {
    ProfileView()
}
