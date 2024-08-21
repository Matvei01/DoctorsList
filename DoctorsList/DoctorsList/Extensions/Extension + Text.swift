//
//  Extension + Text.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 20.08.2024.
//

import SwiftUI

extension Text {
    func semiboldFont() -> some View {
        self
            .font(.SFProDisplay.semibold(size: 16))
            .foregroundStyle(.appBlack)
    }
}


