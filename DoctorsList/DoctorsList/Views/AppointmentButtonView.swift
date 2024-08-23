//
//  AppointmentButtonView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct AppointmentButtonView<Destination: View>: View {
    var buttonText: String
    var buttonColor: Color
    var destination: Destination
    
    var body: some View {
        HStack {
            NavigationLink(destination: destination) {
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
        buttonColor: Color.appPink, destination: DetailsCardView()
    )
}
