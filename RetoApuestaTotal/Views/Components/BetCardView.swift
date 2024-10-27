//
//  BetCardView.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct BetCardView: View {
    var betDetail: BetsDetailsAll
    @StateObject var viewModel = BetViewModel()
    @State private var showDetail = false
    
    private var potentialWinnings: Double {
        let stake = Double(betDetail.totalStake) ?? 0
        let odds = Double(betDetail.totalOdds) ?? 0
        return stake * odds
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
            referenceView
            alertView
            betDetailsView
            amountView
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
    
    private var headerView: some View {
        HStack {
            Image(systemName: betDetail.betStatus == 1 ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(betDetail.betStatus == 1 ? .white : .black)
                .font(.title3)
            
            Text("Apuesta \(betDetail.betStatusName.rawValue)")
                .font(.headline)
            
            Spacer()
            
            Button("Ver Detalle") {
                showDetail = true
            }
            .buttonStyle(.bordered)
            .tint(.white)
            .opacity(0.8)
        }
        .padding()
        .background(Color(hex: "FF0000"))
        .foregroundColor(.white)
        .cornerRadius(8)
        .sheet(isPresented: $showDetail) {
            BetDetailView(viewModel: viewModel, selectedBetDetail: betDetail)
        }
    }
    
    private var referenceView: some View {
        HStack {
            Text("Referencia de apuesta \(betDetail.betID)")
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(8)
    }
    
    private var alertView: some View {
        HStack {
            Image(systemName: "bell.fill")
                .foregroundColor(.gray)
            Text("Alertas en vivo")
                .foregroundColor(.gray)
            Spacer()
            Text("Apuesta Total")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
    
    private var betDetailsView: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(betDetail.betSelections) { selection in
                VStack(alignment: .leading, spacing: 4) {
                    Text(selection.eventName)
                        .font(.headline)
                    Text(selection.marketName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(selection.name)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Cuota: \(selection.price)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding(.vertical, 4)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
    
    private var amountView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Importe")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("S/\(betDetail.totalStake)")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Ganancias potenciales")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("S/\(String(format: "%.2f", potentialWinnings))")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
