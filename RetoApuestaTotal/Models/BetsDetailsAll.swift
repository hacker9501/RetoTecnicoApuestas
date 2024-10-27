//
//  BetsDetailsAll.swift
//  RetoApuesta
//
//  Created by Elver Mayta Hernández on 20/10/24.
//

import Foundation

// MARK: - BetsDetailsAll
struct BetsDetailsAll: Codable, Identifiable {
    var id = UUID()
    let betNivel: BetNivel
    let betStarts: Int
    let betStatusName: BetStatusName
    let betTypeName: BetTypeName
    let bgSrc: BgSrc
    let cashoutOdds, totalOdds, totalStake, totalWin: String
    let cashoutValue, createdDate: String
    let betSelections: [BetSelection]
    let betStatus, betType, betID: Int

    enum CodingKeys: String, CodingKey {
        case betNivel = "BetNivel"
        case betStarts = "BetStarts"
        case betStatusName = "BetStatusName"
        case betTypeName = "BetTypeName"
        case bgSrc = "BgSrc"
        case cashoutOdds = "CashoutOdds"
        case totalOdds = "TotalOdds"
        case totalStake = "TotalStake"
        case totalWin = "TotalWin"
        case cashoutValue = "CashoutValue"
        case createdDate = "CreatedDate"
        case betSelections = "BetSelections"
        case betStatus = "BetStatus"
        case betType = "BetType"
        case betID = "BetId"
    }
}

enum BetNivel: String, Codable {
    case capo = "Capo"
    case cazafijas = "Cazafijas"
    case donatelo = "Donatelo"
    case leyenda = "Leyenda"
    case master = "Master"
}

// MARK: - BetSelection
struct BetSelection: Codable, Identifiable {
    var id = UUID()
    let selectionID, selectionStatus: Int
    let price, name: String
    let spec: Spec?
    let marketTypeID, marketID: Int
    let marketName: String
    let isLive, isBetBuilder, isBanker, isVirtual: Bool
    let bbSelections: [BBSelection]?
    let eventID: Int
    let eventCode: JSONNull?
    let feedEventID: Int
    let eventName: String
    let sportTypeID, categoryID: Int
    let categoryName: JSONNull?
    let champID: Int
    let champName: JSONNull?
    let eventScore: String?
    let gameTime: JSONNull?
    let eventDate: String
    let pitcherInfo, runners: JSONNull?
    let extraEventInfo: String?
    let rc: Bool
    let liveInfoAtEventMinute: JSONNull?
    let isLiveOrVirtual, earlyPayout, boreDraw: Bool
    let deadHeatFactor: JSONNull?
    let dbID: Int

    enum CodingKeys: String, CodingKey {
        case selectionID = "SelectionId"
        case selectionStatus = "SelectionStatus"
        case price = "Price"
        case name = "Name"
        case spec = "Spec"
        case marketTypeID = "MarketTypeId"
        case marketID = "MarketId"
        case marketName = "MarketName"
        case isLive = "IsLive"
        case isBetBuilder = "IsBetBuilder"
        case isBanker = "IsBanker"
        case isVirtual = "IsVirtual"
        case bbSelections = "BBSelections"
        case eventID = "EventId"
        case eventCode = "EventCode"
        case feedEventID = "FeedEventId"
        case eventName = "EventName"
        case sportTypeID = "SportTypeId"
        case categoryID = "CategoryId"
        case categoryName = "CategoryName"
        case champID = "ChampId"
        case champName = "ChampName"
        case eventScore = "EventScore"
        case gameTime = "GameTime"
        case eventDate = "EventDate"
        case pitcherInfo = "PitcherInfo"
        case runners = "Runners"
        case extraEventInfo = "ExtraEventInfo"
        case rc = "RC"
        case liveInfoAtEventMinute = "LiveInfoAtEventMinute"
        case isLiveOrVirtual = "IsLiveOrVirtual"
        case earlyPayout = "EarlyPayout"
        case boreDraw = "BoreDraw"
        case deadHeatFactor = "DeadHeatFactor"
        case dbID = "DbId"
    }
}

// MARK: - BBSelection
struct BBSelection: Codable {
    let selectionID: Int
    let selectionName, marketName: String
    let earlyPayout, boreDraw: Bool
    let selectionStatus: Int

    enum CodingKeys: String, CodingKey {
        case selectionID = "SelectionId"
        case selectionName = "SelectionName"
        case marketName = "MarketName"
        case earlyPayout = "EarlyPayout"
        case boreDraw = "BoreDraw"
        case selectionStatus = "SelectionStatus"
    }
}

enum Spec: String, Codable {
    case empty = ""
    case the105 = "{\"1\":\"0.5\"}"
    case the125 = "{\"1\":\"2.5\"}"
    case the15PreMarkettext256899 = "{\"15\":\"pre:markettext:256899\"}"
    case the15WayTwo103Two = "{\"15\":\"way:two\",\"103\":\"two\"}"
    case the228200238259 = "{\"22\":\"82:00\",\"23\":\"82:59\"}"
    case the93 = "{\"9\":\"3\"}"
    case the94 = "{\"9\":\"4\"}"
}

enum BetStatusName: String, Codable {
    case cashout = "Cashout"
    case ganado = "Ganado"
    case perdido = "Perdido"
}

enum BetTypeName: String, Codable {
    case múltiple = "Múltiple"
    case simple = "Simple"
}

enum BgSrc: String, Codable {
    case nextStaticMediaAjustador24B50A19Jpg = "/_next/static/media/ajustador.24b50a19.jpg"
    case nextStaticMediaCapoE310Ca9AJpg = "/_next/static/media/capo.e310ca9a.jpg"
    case nextStaticMediaCazafijas47B1D146Jpg = "/_next/static/media/cazafijas.47b1d146.jpg"
    case nextStaticMediaLeyendaDd66538FJpg = "/_next/static/media/leyenda.dd66538f.jpg"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
