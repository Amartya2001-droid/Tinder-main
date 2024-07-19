//
//  AuthServiceProtocol.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

protocol AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String
    func deleteAccount() async throws 
    func login(withEmail email: String, password: String) async throws -> String
    func sendResetPasswordLink(toEmail email: String) async throws
    func signOut()
}
