//
//  AppointmentButtonView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct AppointmentButtonView<Destination: View>: View {
    var destination: Destination
    
    var body: some View {
        HStack {
            NavigationLink(destination: destination) {
                Text("Записаться")
                    .frame(maxWidth: .infinity)
                    .font(.SFProDisplay.semibold(size: 16))
                    .foregroundStyle(.white)
                    .padding(.vertical, 15)
                    .background(Color.appPink)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    AppointmentButtonView(destination: Text("Text")
    )
}
