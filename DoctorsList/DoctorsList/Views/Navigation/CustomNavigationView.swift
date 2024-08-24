//
//  CustomNavigationView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct CustomNavigationView: View {
    var title: String
    var showBackButton: Bool = false
    var backButtonAction: (() -> Void)?

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            if showBackButton {
                Button(action: {
                    if let backButtonAction = backButtonAction {
                        backButtonAction()
                    } else {
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Image(.back)
                }
            }
            Spacer()
            Text(title)
                .font(.SFProDisplay.medium(size: 20))
                .foregroundStyle(.appBlack)
            Spacer()
            if showBackButton {
                Spacer().frame(width: 44)
            }
        }
        .padding()
        .background(Color.appLightGray)
    }
}

#Preview {
    CustomNavigationView(title: "Педиатор")
}
