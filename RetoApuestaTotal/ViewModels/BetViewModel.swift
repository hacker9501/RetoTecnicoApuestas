//
//  BetViewModel.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation

class BetViewModel: ObservableObject {
    
    @Published var betsAll: [BetsAll] = []
    @Published var betsDetailsAll: [BetsDetailsAll] = []
    @Published var loginUsers: [User] = []
    @Published var searchText: String = ""
    @Published var filteredBets: [BetsDetailsAll] = []
    @Published var selectedFilter: String? = nil
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
    @Published var crossedData: [(betDetail: BetsDetailsAll, bet: BetsAll?)] = []
    
    init() {
        loadBetsAllData()
        loadBetsDetailsAllData()
        loadUsers()
        loadBetsData()
        applyFilter()
        crossData()
    }
    
    
    private let staticUser = User(name: "User Apuesta Total", correo: "apuestatotal@gmail.com", password: "12345")
    
    // Cargar `betsAll.json` desde el bundle de la app
    func loadBetsAllData() {
        if let bets = LocalFileService.loadJSON(from: "betsAll", as: [BetsAll].self) {
            self.betsAll = bets
        } else {
            print("No se pudo cargar betsAll.json")
        }
    }
    
    func loadBetsDetailsAllData() {
        if let betsDetails = LocalFileService.loadJSON(from: "betsDetailsAll", as: [BetsDetailsAll].self) {
            self.betsDetailsAll = betsDetails
        } else {
            print("No se pudo cargar betsDetailsAll.json")
        }
    }
    
    func loadUsers() {
        if let loginBet = LocalFileService.loadJSON(from: "user", as: [User].self) {
            self.loginUsers = loginBet
        } else {
            print("No se pudo cargar user.json")
        }
    }
    
    func loadBetsData() {
        if let bets = LocalFileService.loadJSON(from: "betsAll", as: [BetsAll].self),
           let details = LocalFileService.loadJSON(from: "betsDetailsAll", as: [BetsDetailsAll].self) {
            self.betsAll = bets
            self.betsDetailsAll = details
            applyFilter()
        }
    }
    
    func loginUser(correo: String, password: String) {
        if correo == staticUser.correo && password == staticUser.password {
            print("Bienvenido, \(staticUser.name)!")
            isLoggedIn = true
            errorMessage = nil
        } else {
            errorMessage = "Credenciales incorrectas."
            isLoggedIn = false
        }
    }
    
    func applyFilter() {
        filteredBets = betsDetailsAll.filter { bet in
            let statusMatches: Bool
            if let selectedFilter = selectedFilter {
                statusMatches = (bet.betStatusName.rawValue == selectedFilter)
            } else {
                statusMatches = true
            }
            let searchMatches = searchText.isEmpty ||
            bet.betSelections.contains(where: { $0.eventName.lowercased().contains(searchText.lowercased()) })
            return statusMatches && searchMatches
        }
    }
    
    func crossData() {
        crossedData = betsDetailsAll.map { betDetail in
            let matchedBet = betsAll.first { bet in
                bet.game == String(betDetail.betID)
            }
            return (betDetail, matchedBet)
        }
    }
    
}
