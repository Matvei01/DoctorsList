//
//  ContentView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 19.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                tabViewItem(
                    view: Text("Главная").font(.largeTitle),
                    title: "Главная",
                    defaultImage: .TabItemImage.homeDefault(),
                    selectedImage: .TabItemImage.homeSelected(),
                    index: 0
                )
                
                tabViewItem(
                    view: Text("Приёмы").font(.largeTitle),
                    title: "Приёмы",
                    defaultImage: .TabItemImage.appointmentsDefault(),
                    selectedImage: .TabItemImage.appointmentsSelected(),
                    index: 1
                )
                
                tabViewItem(
                    view: Text("Чат").font(.largeTitle),
                    title: "Чат",
                    defaultImage: .TabItemImage.chatDefault(),
                    selectedImage: .TabItemImage.chatSelected(),
                    index: 2
                )
                .badge(1)
                
                tabViewItem(
                    view: Text("Профиль").font(.largeTitle),
                    title: "Профиль",
                    defaultImage: .TabItemImage.profileDefault(),
                    selectedImage: .TabItemImage.profileSelected(),
                    index: 3
                )
            }
            .tint(.appPink)
        }
    }
    
    @ViewBuilder
    private func tabViewItem<V: View>(view: V,
                                      title: String,
                                      defaultImage: String,
                                      selectedImage: String,
                                      index: Int) -> some View {
        view
            .tabItem {
                VStack {
                    Image(selectedIndex == index ? selectedImage : defaultImage)
                    Text(title)
                        .tabItemTextStyle()
                }
            }
            .tag(index)
    }
}

#Preview {
    ContentView()
}
