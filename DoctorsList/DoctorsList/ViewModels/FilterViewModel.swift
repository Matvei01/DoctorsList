//
//  FilterViewModel.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import Foundation

enum FilterOption: String, CaseIterable {
    case price = "По цене"
    case experience = "По стажу"
    case rating = "По рейтингу"
}

protocol FilterViewModelProtocol: AnyObject {
    var selectedFilter: FilterOption { get set }
    var isAscending: Bool { get set }
    var filters: [FilterOption] { get }
    func selectFilter(_ filter: FilterOption)
}

final class FilterViewModel: ObservableObject, FilterViewModelProtocol {
    @Published var selectedFilter: FilterOption = .price
    @Published var isAscending: Bool = true
    let filters: [FilterOption] = FilterOption.allCases
    
    func selectFilter(_ filter: FilterOption) {
        if selectedFilter == filter {
            toggleSortOrder()
        } else {
            selectedFilter = filter
            isAscending = true
        }
    }
    
    private func toggleSortOrder() {
        isAscending.toggle()
    }
}
