//
//  DoctorPriceView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorPriceView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 26) {
                CustomNavigationView(title: "Стоимость услуг", showBackButton: true)
                VStack(spacing: 24) {
                    ConsultationTypeView(
                        consultType: "Видеоконсультация",
                        anyText: "30 мин",
                        priceText: "600 ₽"
                    )
                    ConsultationTypeView(
                        consultType: "Чат с врачом",
                        anyText: "30 мин",
                        priceText: "600 ₽"
                    )
                    ConsultationTypeView(
                        consultType: "Приём в клинике",
                        anyText: "В клинике",
                        priceText: "600 ₽"
                    )
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            .navigationBarHidden(true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.appLightGray)
    }
}

#Preview {
    DoctorPriceView()
}
