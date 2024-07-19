//
//  SearchViewModel.swift
//  HeartSync
//
//  Created by Stephan Dowless on 2/3/24.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    private let service: SearchServiceProtocol
    
    init(service: SearchServiceProtocol) {
        self.service = service
    }
    
    func fetchUsers(_ userManager: UserManager) async {
        guard let currentUser = userManager.currentUser else { return }
        
        do {
            let users = try await service.fetchUsers()
            
            self.users = users.filter({
                !currentUser.blockedUIDs.contains($0.id) &&
                !currentUser.blockedByUIDs.contains($0.id)
            })
        } catch {
            print("DEBUG: Failed to fetch users with error: \(error)")
        }
    }
}
