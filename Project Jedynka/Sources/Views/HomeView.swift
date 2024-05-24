//
//  HomeView.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            createNavigationBar()
            createScrollableView()
        }
        .padding(.horizontal, .marginValue)
    }
}
private extension HomeView {
    func createNavigationBar() -> some View {
        NavigationBar()
            .padding(.top, 12)
            .padding(.bottom, 12)
    }
    func createScrollableView() -> some View { ScrollView(showsIndicators: false) {
        VStack(spacing: 0) {
            Spacer().frame(height: 80)
            createBalanceView()
            Spacer().frame(height: 72)
            createActionsView()
            Spacer().frame(height: 52)
            createTransactionsView()
            Spacer().frame(height: 24)
        }
    }}
}
private extension HomeView {
    func createBalanceView() -> some View {
        BalanceView()
    }
    func createActionsView() -> some View {
        ActionsView()
    }
    func createTransactionsView() -> some View {
        TransactionsView()
    }
}


// MARK: - NavigationBar
fileprivate struct NavigationBar: View {
    var body: some View {
        HStack(spacing: 8) {
            createProfileButton()
            createSearchBar()
            createStatsButton()
        }
        .frame(maxWidth: .infinity)
    }
}
private extension NavigationBar {
    func createProfileButton() -> some View { NavigationLink(destination: onProfileButtonTap) {
        Text("PJ")
            .font(.bold(14))
            .foregroundStyle(.onBackground75)
            .kerning(-0.25)
            .frame(width: height, height: height)
            .background(Circle().applyDefaultBackgroundAndStroke())
    }}
    func createSearchBar() -> some View {
        HStack(spacing: 6) {
            createSearchBarIcon()
            createSearchBarTextField()
        }
        .padding(.horizontal, 12)
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .background(Capsule().applyDefaultBackgroundAndStroke())
    }
    func createStatsButton() -> some View { Button(action: onStatsButtonTap) {
        Image(.stats)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundStyle(.onBackground75)
            .frame(width: height, height: height)
            .background(Circle().applyDefaultBackgroundAndStroke())
    }}
}
private extension NavigationBar {
    func createSearchBarIcon() -> some View {
        Image(.search)
            .frame(width: 24, height: 24)
            .foregroundStyle(.onBackground75)
    }
    func createSearchBarTextField() -> some View {
        TextField("", text: .constant("Search"))
            .font(.regular(14))
            .foregroundStyle(.onBackground75)
            .kerning(0.25)
    }
}
private extension NavigationBar {
    var height: CGFloat { 40 }
}
private extension NavigationBar {
    func onProfileButtonTap() -> some View { ProfileView() }
    func onStatsButtonTap() {}
}

// MARK: - BalanceView
fileprivate struct BalanceView: View {
    var body: some View {
        VStack(spacing: 0) {
            createTitle()
            Spacer().frame(height: 6)
            createValue()
            Spacer().frame(height: 20)
            createAccountsButton()
        }
    }
}
private extension BalanceView {
    func createTitle() -> some View {
        Text("Total Balance")
            .font(.regular(14))
            .foregroundStyle(.onBackground75)
            .kerning(0.5)
    }
    func createValue() -> some View {
        Component.Text.Currency(amount: 1410.01)
    }
    func createAccountsButton() -> some View { Button(action: onAccountsButtonTap) {
        Text("Accounts")
            .font(.medium(14))
            .foregroundStyle(.onBackground75)
            .kerning(0.25)
            .padding(.horizontal, 20)
            .frame(height: 44)
            .background(Color.onBackground15)
            .mask(Capsule())
    }}
}
private extension BalanceView {
    func onAccountsButtonTap() {}
}

// MARK: - ActionsView
fileprivate struct ActionsView: View {
    @State var isSendMoneyViewActive: Bool = false


    var body: some View {
        HStack(spacing: 12) {
            ForEach(0...1, id: \.self, content: createItem)
        }
    }
}
private extension ActionsView {
    func createItem(_ index: Int) -> some View { NavigationLink(isActive: $isSendMoneyViewActive, destination: { onItemTap(index) }) {
        VStack(spacing: 0) {
            createItemTitle(index)
            Spacer()
            createItemBottomView(index)
        }
        .padding(.top, 16)
        .padding(.bottom, 20)
        .padding(.horizontal, 16)
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(getBackgroundColor(index))
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }}
}
private extension ActionsView {
    func createItemTitle(_ index: Int) -> some View {
        Text(getText(index))
            .font(.semiBold(20))
            .foregroundStyle(.onBackground)
            .kerning(-0.1)
            .lineSpacing(1)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createItemBottomView(_ index: Int) -> some View {
        HStack(spacing: 0) {
            createBottomIcon(index)
            Spacer()
            createBottomArrow()
        }
    }
}
private extension ActionsView {
    func createBottomIcon(_ index: Int) -> some View {
        Image(getIcon(index))
            .resizable()
            .foregroundStyle(.onBackground)
            .frame(width: 24, height: 24)
            .frame(width: 40, height: 40)
            .background(Color.onBackground10)
            .mask(Circle())
    }
    func createBottomArrow() -> some View {
        Image(.arrowOpen)
            .resizable()
            .foregroundStyle(.onBackground)
            .frame(width: 24, height: 24)
    }
}
private extension ActionsView {
    func getBackgroundColor(_ index: Int) -> Color { switch index {
        case 0: .accent
        case 1: .onBackground30
        default: fatalError()
    }}
    func getText(_ index: Int) -> String { switch index {
        case 0: "Send your money"
        case 1: "Talk to a grizzly bear"
        default: fatalError()
    }}
    func getIcon(_ index: Int) -> ImageResource { switch index {
        case 0: .creditCard
        case 1: .chat
        default: fatalError()
    }}
}
private extension ActionsView {
    func onItemTap(_ index: Int) -> some View { switch index {
        case 0: SendMoneyView(isActive: $isSendMoneyViewActive)
        case 1: SendMoneyView(isActive: $isSendMoneyViewActive)
        default: fatalError()
    }}
}

// MARK: - TransactionsView
fileprivate struct TransactionsView: View {
    var body: some View {
        VStack(spacing: 20) {
            createHeader()
            createItems()
        }
    }
}
private extension TransactionsView {
    func createHeader() -> some View {
        HStack(spacing: 0) {
            createHeaderTitle()
            Spacer()
            createHeaderButton()
        }
    }
    func createItems() -> some View {
        VStack(spacing: 12) {
            ForEach(0..<12, id: \.self, content: createItem)
        }
    }
}
private extension TransactionsView {
    func createHeaderTitle() -> some View {
        Text("Transactions")
            .font(.regular(20))
            .foregroundStyle(.onBackground75)
            .kerning(-0.1)
    }
    func createHeaderButton() -> some View { Button(action: onHeaderButtonTap) {
        Text("See all")
            .font(.regular(14))
            .foregroundStyle(.onBackground50)
    }}
    func createItem(_ index: Int) -> some View {
        HStack(spacing: 0) {
            createImagePlaceholder(index)
            Spacer().frame(width: 16)
            createLeftTextPlaceholder(index)
            Spacer()
            createRightTextPlaceholder(index)
        }
        .padding(.horizontal, 16)
        .frame(height: 96)
        .background(backgroundPlaceholderColor(index))
        .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}
private extension TransactionsView {
    func createImagePlaceholder(_ index: Int) -> some View {
        Circle()
            .fill(imagePlaceholderColor(index))
            .frame(width: 40, height: 40)
    }
    func createLeftTextPlaceholder(_ index: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            createTitlePlaceholder(index)
            createDatePlaceholder(index)
        }
    }
    func createRightTextPlaceholder(_ index: Int) -> some View {
        Capsule()
            .fill(amountPlaceholderColor(index))
            .frame(width: .random(in: 44...60), height: 17)
    }
}
private extension TransactionsView {
    func createTitlePlaceholder(_ index: Int) -> some View {
        Capsule()
            .fill(titlePlaceholderColor(index))
            .frame(width: .random(in: 90...150), height: 19)
    }
    func createDatePlaceholder(_ index: Int) -> some View {
        Capsule()
            .fill(datePlaceholderColor(index))
            .frame(width: .random(in: 40...120), height: 15)
    }
}
private extension TransactionsView {
    func backgroundPlaceholderColor(_ index: Int) -> Color { switch isColorLight(index) {
        case true: .onBackground
        case false: .onBackground15
    }}
    func imagePlaceholderColor(_ index: Int) -> Color { switch isColorLight(index) {
        case true: .background10
        case false: .onBackground10
    }}
    func titlePlaceholderColor(_ index: Int) -> Color { switch isColorLight(index) {
        case true: .background30
        case false: .onBackground30
    }}
    func datePlaceholderColor(_ index: Int) -> Color { switch isColorLight(index) {
        case true: .background15
        case false: .onBackground15
    }}
    func amountPlaceholderColor(_ index: Int) -> Color { switch isColorLight(index) {
        case true: .background30
        case false: .onBackground30
    }}
}
private extension TransactionsView {
    func isColorLight(_ index: Int) -> Bool { index % 3 == 0 }
}
private extension TransactionsView {
    func onHeaderButtonTap() {}
    func onItemTap() {}
}


// MARK: - Preview
#Preview {
    HomeView()
}
