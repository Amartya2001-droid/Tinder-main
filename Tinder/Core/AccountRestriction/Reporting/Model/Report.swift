//
//  Report.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import Foundation

struct Report: Codable {
    let reporterUid: String
    let accountOwnerUid: String
    let reportReason: ReportOptionsModel
}
