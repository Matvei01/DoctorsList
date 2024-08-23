//
//  DoctorImageView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorImageView: View {
    var body: some View {
        Image(.doctor)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}

#Preview {
    DoctorImageView()
}
