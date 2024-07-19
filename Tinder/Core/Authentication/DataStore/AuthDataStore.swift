//
//  AuthViewModel.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

class AuthDataStore: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
