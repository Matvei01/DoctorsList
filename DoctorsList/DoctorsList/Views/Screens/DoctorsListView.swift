//
//  DoctorsListView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorsListView: View {
    @StateObject private var viewModel = UserViewModel()
    @StateObject private var filterViewModel = FilterViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 26) {
                    CustomNavigationView(title: "Врачи")
                    VStack(spacing: 24) {
                        VStack(spacing: 16) {
                            CustomSearchBarView(text: $searchText)
                            FilterView(viewModel: filterViewModel)
                        }
                        ScrollView {
                            ForEach(filteredUsers) { user in
                                DoctorCardView(doctor: user)
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
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
    
    // Фильтрация врачей на основе выбранного фильтра и текста поиска
    private var filteredUsers: [User] {
        let filteredBySearch = viewModel.users.filter { user in
            searchText.isEmpty ? true : user.firstName.contains(searchText) || user.lastName.contains(searchText)
        }
        
        switch filterViewModel.selectedFilter {
        case .price:
            return filteredBySearch.sorted { $0.hospitalPrice < $1.hospitalPrice }
        case .experience:
            return filteredBySearch.sorted { $0.seniority > $1.seniority }
        case .rating:
            return filteredBySearch.sorted { $0.ratingsRating > $1.ratingsRating }
        }
    }
}

#Preview {
    DoctorsListView()
}
