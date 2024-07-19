//
//  AuthenticationType.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

enum AuthType {
    case createAccount
    case login
}

extension AuthType: Identifiable {
    var id: String { return NSUUID().uuidString }
}
