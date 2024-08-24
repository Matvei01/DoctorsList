//
//  DoctorPriceViewModel.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import Foundation

enum ConsultationType: Identifiable {
    case videoConsultation(duration: String, price: String)
    case chatConsultation(duration: String, price: String)
    case clinicVisit(description: String, price: String)
    
    var id: String {
        switch self {
        case .videoConsultation:
            return "videoConsultation"
        case .chatConsultation:
            return "chatConsultation"
        case .clinicVisit:
            return "clinicVisit"
        }
    }
}

protocol DoctorPriceViewModelProtocol: AnyObject {
    var consultationPrices: [ConsultationType] { get }
}

final class DoctorPriceViewModel: ObservableObject, DoctorPriceViewModelProtocol {
    private let doctor: User
    
    var consultationPrices: [ConsultationType] {
        [
            .videoConsultation(duration: "30 мин", price: formattedPrice(doctor.videoChatPrice)),
            .chatConsultation(duration: "30 мин", price: formattedPrice(doctor.textChatPrice)),
            .clinicVisit(description: "В клинике", price: formattedPrice(doctor.hospitalPrice))
        ]
    }
    
    init(doctor: User) {
        self.doctor = doctor
    }
    
    private func formattedPrice(_ price: Double) -> String {
        return String(format: "%.0f ₽", price)
    }
}
