//
//  TabItemTextModifier.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 20.08.2024.
//

import SwiftUI

struct TabItemTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.SFProDisplay.regular(size: 12))
            .foregroundStyle(.appDarkGray)
    }
}
