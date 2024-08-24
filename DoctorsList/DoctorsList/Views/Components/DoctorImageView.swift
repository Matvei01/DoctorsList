//
//  DoctorImageView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 21.08.2024.
//

import SwiftUI

struct DoctorImageView: View {
    var imageUrl: URL?
    
    var body: some View {
        AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .empty:
                CircularImageView(image: Image(.plugPicture))
            case .success(let image):
                CircularImageView(image: image)
            case .failure:
                CircularImageView(image: Image(systemName: "person.fill.xmark"))
            @unknown default:
                CircularImageView(image: Image(.plugPicture))
            }
        }
    }
}

#Preview {
    DoctorImageView(imageUrl: URL(string: "https://example.com/doctor_image.png"))
}
