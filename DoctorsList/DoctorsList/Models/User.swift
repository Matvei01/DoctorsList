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
    let workExperience: [WorkExperience]
    let specialization: [Specialization]
    let categoryLabel: String
    let isFavorite: Bool
    let freeReceptionTime: [FreeReceptionTime]
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case patronymic
        case seniority
        case ratingsRating = "ratings_rating"
        case hospitalPrice = "hospital_price"
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case avatar
        case higherEducation = "higher_education"
        case workExperience = "work_expirience"
        case specialization
        case categoryLabel = "category_label"
        case isFavorite = "is_favorite"
        case freeReceptionTime = "free_reception_time"
    }
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

