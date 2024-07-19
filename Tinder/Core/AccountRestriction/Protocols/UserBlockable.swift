//
//  UserBlockable.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

protocol UserBlockable {
    var onBlock: (() -> Void)? { get }
}
