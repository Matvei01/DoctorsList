//
//  DoctorPriceView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorPriceView: View {
    @ObservedObject var viewModel: DoctorPriceViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 26) {
                CustomNavigationView(title: "Стоимость услуг", showBackButton: true)
                VStack(spacing: 24) {
                    ForEach(viewModel.consultationPrices) { consultation in
                        switch consultation {
                        case .videoConsultation(let duration, let price):
                            ConsultationTypeView(
                                consultType: "Видеоконсультация",
                                anyText: duration,
                                priceText: price
                            )
                        case .chatConsultation(let duration, let price):
                            ConsultationTypeView(
                                consultType: "Чат с врачом",
                                anyText: duration,
                                priceText: price
                            )
                        case .clinicVisit(let description, let price):
                            ConsultationTypeView(
                                consultType: "Приём в клинике",
                                anyText: description,
                                priceText: price
                            )
                        }
                    }
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
