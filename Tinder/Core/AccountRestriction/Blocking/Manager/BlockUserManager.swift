//
//  BlockUserManager.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

class BlockUserManager: ObservableObject {
    
    private let service: BlockUserService
    
    init(service: BlockUserService) {
        self.service = service
    }
    
    func blockUser(_ user: User) async {
        do {
            try await service.blockUser(user)
        } catch {
            print("DEBUG: Failed to block user with error: \(error)")
        }
    }
    
}
