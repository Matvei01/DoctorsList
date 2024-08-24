//
//  MainView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 19.08.2024.
//

import SwiftUI

struct MainView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                DoctorsListView()
                    .tag(0)
                Text("Приёмы")
                    .font(.largeTitle)
                    .tag(1)
                Text("Чат")
                    .font(.largeTitle)
                    .tag(2)
                Text("Профиль")
                    .font(.largeTitle)
                    .tag(3)
            }
            .tint(.appPink)
            
            HStack {
                homeTabBarItem()
                Spacer()
                appointmentsTabBarItem()
                Spacer()
                chatTabBarItem()
                Spacer()
                profileTabBarItem()
            }
            .padding(.horizontal, 26)
            .padding(.top, 15)
            .background(Color.white)
        }
    }
}

// MARK: -  Private Methods
extension MainView {
    private func homeTabBarItem() -> some View {
        tabBarItem(
            index: 0,
            title: "Главная",
            image: selectedIndex == 0 ? .TabItemImage.homeSelected() : .TabItemImage.homeDefault()
        )
    }
    
    private func appointmentsTabBarItem() -> some View {
        tabBarItem(
            index: 1,
            title: "Приёмы",
            image: selectedIndex == 1 ? .TabItemImage.appointmentsSelected() : .TabItemImage.appointmentsDefault()
        )
    }
    
    private func chatTabBarItem() -> some View {
        tabBarItem(
            index: 2,
            title: "Чат",
            image: selectedIndex == 2 ? .TabItemImage.chatSelected() : .TabItemImage.chatDefault(),
            showBadge: true,
            badgeCount: 1
        )
    }
    
    private func profileTabBarItem() -> some View {
        tabBarItem(
            index: 3,
            title: "Профиль",
            image: selectedIndex == 3 ? .TabItemImage.profileSelected() : .TabItemImage.profileDefault()
        )
    }
    
    private func tabBarItem(index: Int,
                            title: String,
                            image: String,
                            showBadge: Bool = false,
                            badgeCount: Int = 0) -> some View {
        Button(action: {
            selectedIndex = index
        }) {
            VStack {
                ZStack {
                    Image(image)
                    if showBadge && badgeCount > 0 {
                        badgeView(badgeCount: badgeCount)
                    }
                }
                Text(title)
                    .font(.SFProDisplay.regular(size: 12))
            }
            .foregroundStyle(selectedIndex == index ? .appPink : .appDarkGray)
        }
    }
    
    private func badgeView(badgeCount: Int) -> some View {
        ZStack {
            Circle()
                .fill(Color.appPink)
                .frame(width: 16, height: 16)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 18, height: 18)
                )
            
            Text("\(badgeCount)")
                .font(.caption2)
                .foregroundStyle(.white)
        }
        .offset(x: 10, y: -10)
    }
}

#Preview {
    MainView()
}

