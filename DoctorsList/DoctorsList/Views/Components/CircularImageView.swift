//
//  CircularImageView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 24.08.2024.
//

import SwiftUI

struct CircularImageView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}

#Preview {
    CircularImageView(image: Image(.plugPicture))
}
