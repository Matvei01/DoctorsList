//
//  ConsultationTypeView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 22.08.2024.
//

import SwiftUI

struct ConsultationTypeView: View {
    var consultType: String
    var anyText: String
    var priceText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(consultType)
                .semiboldFont()
            PriceInfoView(
                anyText: anyText,
                priceText: priceText,
                font: .SFProDisplay.regular(size: 16)
            )
        }
    }
}

#Preview {
    ConsultationTypeView(
        consultType: "Видео консультация",
        anyText: "30 мин",
        priceText: "600 ₽"
    )
}
