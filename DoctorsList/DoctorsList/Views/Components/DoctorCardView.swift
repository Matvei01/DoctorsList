//
//  DoctorCardView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorCardView: View {
    @State private var isLiked: Bool
    
    var doctor: User
    
    init(doctor: User) {
        self.doctor = doctor
        self._isLiked = State(initialValue: doctor.isFavorite)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            doctorInfoView
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            
            if hasFreeReceptionTime() {
                AppointmentButtonView(
                    destination: DetailsCardView(viewModel: DetailsCardViewModel(doctor: doctor))
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            } else {
                noFreeTimeView
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var doctorInfoView: some View {
        HStack(alignment: .top, spacing: 16) {
            DoctorImageView(imageUrl: doctor.avatar)
                .alignmentGuide(.top) { _ in 0 }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(doctor.lastName)
                        .semiboldFont()
                    Spacer()
                    likeButton
                }
                Text("\(doctor.firstName) \(doctor.patronymic)")
                    .semiboldFont()
                starRatingView
                Text("\(doctor.formattedSpecializations())・стаж \(doctor.seniority) лет")
                    .regularFont()
                Text("от \(String(format: "%.0f", doctor.hospitalPrice)) ₽")
                    .semiboldFont()
            }
        }
    }
    
    private var likeButton: some View {
        Button(action: {
            isLiked.toggle()
        }) {
            Image(isLiked ? .LikeImage.heartSelected() : .LikeImage.heartDefault())
        }
    }
    
    private var starRatingView: some View {
        HStack {
            let roundedRating = Int(round(doctor.ratingsRating))
            ForEach(0..<roundedRating, id: \.self) { _ in
                Image(.starSelected)
            }
            
            if roundedRating < 5 {
                ForEach(roundedRating..<5, id: \.self) { _ in
                    Image(.starDefault)
                }
            }
        }
    }
    
    private func hasFreeReceptionTime() -> Bool {
        !doctor.freeReceptionTime.isEmpty
    }
    
    private var noFreeTimeView: some View {
        Text("Нет свободного расписания")
            .semiboldFont()
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.appGray)
            .foregroundStyle(.appBlack)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
