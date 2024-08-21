//
//  DoctorCardView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorCardView: View {
    @State private var isLiked = false
    
    var buttonText: String
    var buttonColor: Color
    
    var body: some View {
        VStack(spacing: 15) {
            doctorInfoView
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            AppointmentButtonView(
                buttonText: buttonText,
                buttonColor: buttonColor
            )
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var doctorInfoView: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(.doctor)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .alignmentGuide(.top) { _ in 0 }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Осташков")
                        .semiboldFont()
                    Spacer()
                    likeButton
                }
                Text("Кирилл Вячеславович")
                    .semiboldFont()
                starRatingView
                Text("Педиатр・стаж 9 лет")
                    .regularFont()
                Text("от 400 ₽")
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
            ForEach(0..<5) { _ in
                Image(.starSelected)
            }
        }
    }
}

#Preview {
    DoctorCardView(buttonText: "Записаться", buttonColor: .appPink)
}
