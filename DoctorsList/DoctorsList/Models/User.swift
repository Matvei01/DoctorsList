//
//  User.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import Foundation

struct RootResponse: Decodable {
    let record: Record
}

struct Record: Decodable {
    let data: UserResponse
}

struct UserResponse: Decodable {
    let users: [User]
}

struct User: Identifiable, Decodable {
    let id: String
    let firstName: String
    let lastName: String
    let patronymic: String
    let seniority: Int
    let ratingsRating: Double
    let hospitalPrice: Double
    let textChatPrice: Double
    let videoChatPrice: Double
    let avatar: URL?
    let higherEducation: [HigherEducation]
    let workExperience: [WorkExperience]?
    let specialization: [Specialization]
    let categoryLabel: String
    let isFavorite: Bool
    let freeReceptionTime: [FreeReceptionTime]
}

struct HigherEducation: Decodable {
    let university: String
}

struct WorkExperience: Decodable {
    let organization: String
}

struct FreeReceptionTime: Decodable {
    let time: Int
}

struct Specialization: Decodable {
    let name: String
}

extension User {
    func formattedSpecializations() -> String {
        if specialization.isEmpty {
            return "Иммунолог"
        } else {
            return specialization.map { $0.name }.joined(separator: "・")
        }
    }
}

