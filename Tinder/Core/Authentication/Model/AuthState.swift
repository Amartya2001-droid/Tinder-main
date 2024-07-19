//
//  AuthState.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

enum AuthState {
    case unauthenticated
    case authenticated(uid: String)
}
