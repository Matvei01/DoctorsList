//
//  PriceInfoView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct PriceInfoView: View {
    var anyText: String
    var priceText: String
    var font: Font
    
    var body: some View {
        HStack {
            HStack {
                Text(anyText)
                    .font(font)
                Spacer()
                Text(priceText)
                    .semiboldFont()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    PriceInfoView(
        anyText: "Стоимость услуг",
        priceText: "от 600 ₽",
        font: .SFProDisplay.semibold(size: 16)
    )
}
