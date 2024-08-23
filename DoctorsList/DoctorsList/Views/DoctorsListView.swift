//
//  DoctorsListView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorsListView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 26) {
                    CustomNavigationView(title: "Педиатры")
                        VStack(spacing: 24) {
                            VStack(spacing: 16) {
                                CustomSearchBarView(text: $searchText)
                                FilterView()
                            }
                            ScrollView() {
                                ForEach(0..<10, id: \.self) { index in
                                    DoctorCardView(
                                        buttonText: "Записаться",
                                        buttonColor: .appPink,
                                        index: index
                                    )
                                    .padding(.bottom, 16)
                                }
                            }
                        }
                        .padding(.horizontal, 17)
                }
                .navigationBarHidden(true)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appLightGray)
        }
    }
}

#Preview {
    DoctorsListView()
}
