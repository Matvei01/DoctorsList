//
//  FilterView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var viewModel: FilterViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(viewModel.filters, id: \.self) { filter in
                FilterButtonView(
                    title: filter.rawValue,
                    isSelected: viewModel.selectedFilter == filter,
                    isAscending: viewModel.isAscending,
                    action: {
                        viewModel.selectFilter(filter)
                    }
                )
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    FilterView(viewModel: FilterViewModel())
}
