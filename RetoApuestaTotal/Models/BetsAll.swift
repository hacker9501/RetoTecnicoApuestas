//
//  BetsAll.swift
//  RetoApuesta
//
//  Created by Elver Mayta Hernández on 20/10/24.
//

import Foundation

// MARK: - BetsAll
struct BetsAll: Codable, Identifiable {
    var id = UUID()
    let db, operation: Int
    let game, createdDate: String
    let status: Status
    let wager: Int
    let winning: Int?
    let odds: Double
    let type: TypeEnum
    let account: Account

    enum CodingKeys: String, CodingKey {
        case db, operation, game
        case createdDate = "created_date"
        case status, wager, winning, odds, type, account
    }
}

enum Account: String, Codable {
    case bettingBonus = "BETTING-BONUS"
    case cash = "CASH"
}

enum Status: String, Codable {
    case cashout = "CASHOUT"
    case lost = "LOST"
    case won = "WON"
}

enum TypeEnum: String, Codable {
    case multiple = "MULTIPLE"
    case simple = "SIMPLE"
}

