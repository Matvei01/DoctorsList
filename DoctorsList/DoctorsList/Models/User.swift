//
//  User.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import Foundation

// Модель ответа
struct UserResponse: Decodable {
    let users: [User]
}

// Модель корневого объекта
struct RootResponse: Decodable {
    let data: UserResponse
}

// Модель пользователя
struct User: Decodable, Identifiable {
    let id: String
    let slug: String
    let firstName: String
    let patronymic: String
    let lastName: String
    let gender: String
    let genderLabel: String
    let specialization: [Specialization]
    let ratings: [Rating]
    let ratingsRating: Double
    let seniority: Int
    let textChatPrice: Double
    let videoChatPrice: Double
    let homePrice: Double
    let hospitalPrice: Double
    let avatar: URL?
    let nearestReceptionTime: Date?
    let freeReceptionTime: [Date]
    let educationTypeLabel: String?
    let higherEducation: [HigherEducation]
    let workExperience: [WorkExperience]
    let rank: Int
    let rankLabel: String
    let scientificDegree: Int
    let scientificDegreeLabel: String
    let category: Int
    let categoryLabel: String
    let isFavorite: Bool
}

// Модель для рейтинга
struct Rating: Decodable {
    let id: Int
    let name: String
    let value: Double
}

// Модель для высшего образования
struct HigherEducation: Decodable {
    let id: Int
    let university: String
    let specialization: String
    let qualification: String
    let startDate: Date
    let endDate: Date
    let untilNow: Bool
    let isModerated: Bool
}

// Модель для рабочего опыта
struct WorkExperience: Decodable {
    let id: Int
    let organization: String
    let position: String
    let startDate: Date
    let endDate: Date?
    let untilNow: Bool
    let isModerated: Bool
}

// Модель для специальности
struct Specialization: Decodable {
    let id: Int
    let name: String
    let isModerated: Bool
}

