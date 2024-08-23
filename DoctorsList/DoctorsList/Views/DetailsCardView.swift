//
//  DetailsCardView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DetailsCardView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 26) {
                CustomNavigationView(title: "Педиатор", showBackButton: true)
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 20) {
                        headerView
                        doctorInfoView
                        PriceInfoView(
                            anyText: "Стоимость услуг",
                            priceText: "от 600 ₽",
                            font: .SFProDisplay.semibold(size: 16)
                        )
                    }
                    footerView
                }
                .padding(.horizontal, 16)
            }
            .navigationBarHidden(true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.appLightGray)
    }
    
    private var headerView: some View {
        HStack(spacing: 16) {
            DoctorImageView()
            VStack(alignment: .leading) {
                Text("Семенова")
                    .semiboldFont()
                Text("Дарья Сергеевна")
                    .semiboldFont()
            }
        }
    }
    
    private var doctorInfoView: some View {
        VStack(alignment: .leading, spacing: 10) {
            DoctorInfoTypeView(
                image: .InfoImage.experience(),
                textInfo: "Опыт работы: 27 лет"
            )
            DoctorInfoTypeView(
                image: .InfoImage.doctorate(),
                textInfo: "Врач высшей категории"
            )
            DoctorInfoTypeView(
                image: .InfoImage.education(),
                textInfo: "1-й ММИ им. И.М.Сеченова"
            )
            DoctorInfoTypeView(
                image: .InfoImage.location(),
                textInfo: "Детская клиника “РебёнОК”"
            )
        }
    }
    
    private var footerView: some View {
        VStack(alignment: .leading) {
            Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                .font(.SFProDisplay.regular(size: 14))
                .foregroundStyle(.appBlack)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
            Spacer()
            AppointmentButtonView(
                buttonText: "Записаться",
                buttonColor: .appPink,
                destination: DoctorPriceView()
            )
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    DetailsCardView()
}
