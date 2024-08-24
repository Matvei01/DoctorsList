//
//  UserViewModel.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import Foundation

protocol UserViewModelProtocol: AnyObject {
    var users: [User] { get }
    func fetchUsers()
}

final class UserViewModel: ObservableObject, UserViewModelProtocol {
    @Published private(set) var users: [User] = []
    
    private let userDataLoader: UserDataLoader
    
    init(userDataLoader: UserDataLoader = .shared) {
        self.userDataLoader = userDataLoader
    }
    
    func fetchUsers() {
        userDataLoader.loadUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                print("Ошибка загрузки пользователей: \(error.localizedDescription)")
            }
        }
    }
}
