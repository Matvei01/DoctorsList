//
//  DetailsCardViewModel.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import Foundation

enum DoctorInfoType: Hashable {
    case experience(years: Int)
    case doctorate(label: String)
    case education(university: String)
    case workExperience(organization: String)
}

protocol DetailsCardViewModelProtocol: AnyObject {
    var doctor: User { get }
    var doctorInfo: [DoctorInfoType] { get }
}

final class DetailsCardViewModel: ObservableObject, DetailsCardViewModelProtocol {
    @Published private(set) var doctor: User

    var doctorInfo: [DoctorInfoType] {
        var info = [DoctorInfoType]()
        
        info.append(.experience(years: doctor.seniority))
        
        if !doctor.categoryLabel.isEmpty {
            info.append(.doctorate(label: doctor.categoryLabel))
        } else {
            info.append(.doctorate(label: "Врач высшей категории"))
        }

        if let university = doctor.higherEducation.first?.university {
            info.append(.education(university: university))
        } else {
            info.append(.education(university: "Южно-Уральский государственный медицинский университет"))
        }

        if let workExperience = doctor.workExperience, !workExperience.isEmpty {
            for experience in workExperience {
                info.append(.workExperience(organization: experience.organization))
            }
        } else {
            info.append(.workExperience(organization: "Челябинская областная клиническая больница"))
        }

        return info
    }
    
    init(doctor: User) {
        self.doctor = doctor
    }
}
