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
                VStack(spacing: 24) {
                   FilterView()
                    ScrollView() {
                        ForEach(0..<10) { _ in
                            DoctorCardView(
                                buttonText: "Записаться",
                                buttonColor: .appPink
                            )
                            .padding(.bottom, 16)
                        }
                    }
                }
                .navigationTitle("Врачи")
                .searchable(text: $searchText)
                .padding(.horizontal, 17)
            }
            .frame(maxWidth: .infinity)
            .background(Color.appLightGray)
        }
    }
}

#Preview {
    DoctorsListView()
}
