//
//  FilterButtonView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct FilterButtonView: View {
    var title: String
    var isSelected: Bool
    var isAscending: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.SFProDisplay.regular(size: 14))
                    .foregroundStyle(isSelected ? .white : .appDarkGray)
                if isSelected {
                    Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 5, height: 10)
                        .foregroundStyle(.white)
                }
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.appPink : Color.white)
        }
        .overlay(
            Rectangle()
                .stroke(Color.appGray.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview {
    FilterButtonView(
        title: "По стажу",
        isSelected: true,
        isAscending: true,
        action: {}
    )
}

