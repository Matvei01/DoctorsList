//
//  FilterView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

enum FilterOption {
    case price, experience, rating
}

struct FilterView: View {
    @State private var selectedFilter: FilterOption = .price
    
    var body: some View {
        HStack(spacing: 0) {
            FilterButtonView(title: "По цене", isSelected: selectedFilter == .price) {
                selectedFilter = .price
            }
            FilterButtonView(title: "По стажу", isSelected: selectedFilter == .experience) {
                selectedFilter = .experience
            }
            FilterButtonView(title: "По рейтингу", isSelected: selectedFilter == .rating) {
                selectedFilter = .rating
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    FilterView()
}
