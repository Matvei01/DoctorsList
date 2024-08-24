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
    
    private let defaultDoctorateLabel = "Врач высшей категории"
    private let defaultUniversity = "Южно-Уральский государственный медицинский университет"
    private let defaultWorkExperience = "Челябинская областная клиническая больница"
    
    var doctorInfo: [DoctorInfoType] {
        var info = [DoctorInfoType]()
        
        info.append(.experience(years: doctor.seniority))
        
        let doctorateLabel = doctor.categoryLabel.isEmpty ? defaultDoctorateLabel : doctor.categoryLabel
        info.append(.doctorate(label: doctorateLabel))
        
        let university = doctor.higherEducation.first?.university ?? defaultUniversity
        info.append(.education(university: university))
        
        let lastWorkExperience = doctor.workExperience.last?.organization ?? defaultWorkExperience
        info.append(.workExperience(organization: lastWorkExperience))
        
        return info
    }
    
    init(doctor: User) {
        self.doctor = doctor
    }
}
