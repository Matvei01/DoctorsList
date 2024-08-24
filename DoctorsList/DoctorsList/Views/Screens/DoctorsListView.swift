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
    
    private var filteredUsers: [User] {
        let filteredBySearch = viewModel.users.filter { user in
            searchText.isEmpty ? true : user.firstName.contains(searchText) || user.lastName.contains(searchText)
        }
        
        let sortedUsers: [User]
        switch filterViewModel.selectedFilter {
        case .price:
            sortedUsers = filteredBySearch.sorted { filterViewModel.isAscending ? $0.hospitalPrice < $1.hospitalPrice : $0.hospitalPrice > $1.hospitalPrice }
        case .experience:
            sortedUsers = filteredBySearch.sorted { filterViewModel.isAscending ? $0.seniority < $1.seniority : $0.seniority > $1.seniority }
        case .rating:
            sortedUsers = filteredBySearch.sorted { filterViewModel.isAscending ? $0.ratingsRating < $1.ratingsRating : $0.ratingsRating > $1.ratingsRating }
        }
        
        return sortedUsers
    }
}

#Preview {
    DoctorsListView()
}
