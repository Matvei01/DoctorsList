//
//  Extension + Text.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 20.08.2024.
//

import SwiftUI

extension Text {
    func tabItemTextStyle() -> some View {
        self.modifier(TabItemTextModifier())
    }
}
