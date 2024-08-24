//
//  DetailsCardView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DetailsCardView: View {
    @ObservedObject var viewModel: DetailsCardViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 26) {
                CustomNavigationView(
                    title: viewModel.doctor.formattedSpecializations(),
                    showBackButton: true
                )
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 20) {
                        headerView
                        doctorInfoView
                        PriceInfoView(
                            anyText: "Стоимость услуг",
                            priceText: String(format: "от %.0f ₽", viewModel.doctor.hospitalPrice),
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
            DoctorImageView(imageUrl: viewModel.doctor.avatar)
            VStack(alignment: .leading) {
                Text(viewModel.doctor.lastName)
                    .semiboldFont()
                Text("\(viewModel.doctor.firstName) \(viewModel.doctor.patronymic)")
                    .semiboldFont()
            }
        }
    }
    
    private var doctorInfoView: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(viewModel.doctorInfo, id: \.self) { info in
                switch info {
                case .experience(let years):
                    DoctorInfoTypeView(
                        image: .InfoImage.experience(),
                        textInfo: "Опыт работы: \(years) лет"
                    )
                case .doctorate(let label):
                    DoctorInfoTypeView(
                        image: .InfoImage.doctorate(),
                        textInfo: label
                    )
                case .education(let university):
                    DoctorInfoTypeView(
                        image: .InfoImage.education(),
                        textInfo: university
                    )
                case .workExperience(let organization):
                    DoctorInfoTypeView(
                        image: .InfoImage.location(),
                        textInfo: organization
                    )
                }
            }
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
                destination: DoctorPriceView(viewModel: DoctorPriceViewModel(doctor: viewModel.doctor))
            )
            .padding(.bottom, 15)
        }
    }
}

