//
//  MockAuthService.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

struct MockAuthService: AuthServiceProtocol {

    func login(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
    
    func createUser(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
    
    func deleteAccount() async throws { }
    
    func sendResetPasswordLink(toEmail email: String) async throws {}
    
    func signOut() {}
}
