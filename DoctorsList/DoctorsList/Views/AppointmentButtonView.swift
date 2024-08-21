//
//  AppointmentButtonView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct AppointmentButtonView: View {
    
    var buttonText: String
    var buttonColor: Color
    
    var body: some View {
        HStack {
            Button(action: { print("Записаться") }) {
                Text(buttonText)
                    .frame(maxWidth: .infinity)
                    .font(.SFProDisplay.semibold(size: 16))
                    .foregroundStyle(.white)
                    .padding(.vertical, 15)
                    .background(buttonColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    AppointmentButtonView(
        buttonText: "Записаться",
        buttonColor: Color.appPink
    )
}
