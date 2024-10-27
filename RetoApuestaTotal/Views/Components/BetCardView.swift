//
//  BetCardView.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct BetCardView: View {
    var bet: BetsDetailsAll
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(bet.betStatusName.rawValue)
                .font(.headline)
            Text("Nivel: \(bet.betNivel.rawValue)")
                .font(.subheadline)
            Text("Estado: \(bet.betStatus)")
                .font(.subheadline)
                .foregroundColor(bet.betStatus.description == "Ganadas" ? .green : .red)
        }
        .padding()
//        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

//#Preview {
//    BetCardView()
//}
