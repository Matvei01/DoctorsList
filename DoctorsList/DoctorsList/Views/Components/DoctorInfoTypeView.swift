//
//  DoctorInfoTypeView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorInfoTypeView: View {
    var image: String
    var textInfo: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            Text(textInfo)
                .regularFont()
        }
    }
}

#Preview {
    DoctorInfoTypeView(
        image: "experience",
        textInfo: "Опыт работы: 27 лет"
    )
}
