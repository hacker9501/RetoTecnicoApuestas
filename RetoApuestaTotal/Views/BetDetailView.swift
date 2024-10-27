//
//  BetDetailView.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct BetDetailView: View {
    var viewModel: BetViewModel
    var selectedBetDetail: BetsDetailsAll

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                VStack(alignment: .center, spacing: 8) {
                    Text("Cruce de Datos")
                        .fontWeight(.bold)
                    Text("Información entre Apuestas y Detalles de Juego")
                }
                
                if let detail = viewModel.crossedData.first(where: { $0.0.betID == selectedBetDetail.betID }) {
                    let (betDetail, bet) = detail

                    VStack(alignment: .center, spacing: 8) {
                        Text("Referencia detalle ID: \(betDetail.betID)")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        if let bet = bet {
                            Text("Game: \(bet.game)")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        } else {
                            Text("No hay apuesta correspondiente.")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .padding(.horizontal)
                } else {
                    Text("No hay detalles disponibles.")
                        .foregroundColor(.red)
                }
                VStack {
                    Image("apuestatotallocalagente")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 480, height: 370)
                        .padding(.top, 60)
                }
            }
            .padding(.vertical)
        }
        .background(Color(UIColor.systemGray6))
        
    }
}

