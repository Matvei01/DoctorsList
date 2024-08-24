//
//  UserDataLoader.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import Foundation

final class UserDataLoader {
    static let shared = UserDataLoader()
    
    private init() {}
    
    func loadUsers(completion: @escaping (Result<[User], JSONLoadError>) -> Void) {
        guard let url = Bundle.main.url(forResource: Link.allUsers.fileName, withExtension: "json") else {
            completion(.failure(.fileNotFound))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let rootResponse = try decoder.decode(RootResponse.self, from: data)
            let users = rootResponse.record.data.users
            
            DispatchQueue.main.async {
                completion(.success(users))
            }
            
        } catch let error as DecodingError {
            DispatchQueue.main.async {
                completion(.failure(.decodingFailed(error)))
            }
            
        } catch {
            DispatchQueue.main.async {
                completion(.failure(.dataLoadingFailed(error)))
            }
        }
    }
}

// MARK: - JSONLoadError
extension UserDataLoader {
    enum JSONLoadError: Error {
        case fileNotFound
        case dataLoadingFailed(Error)
        case decodingFailed(Error)
    }
}

// MARK: - Link
extension UserDataLoader {
    enum Link {
        case allUsers
        
        var fileName: String {
            switch self {
            case .allUsers:
                return "655b754e0574da7622c94aa4"
            }
        }
    }
}

