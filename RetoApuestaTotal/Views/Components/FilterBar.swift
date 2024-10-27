//
//  FilterBar.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct FilterBar: View {
    @Binding var selectedFilter: String?
    var applyFilter: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                selectedFilter = nil
                applyFilter()
            }) {
                Text("Todas")
                    .foregroundColor(selectedFilter == nil ? .white : .gray)
                    .padding(10)
                    .background(selectedFilter == nil ? Color.black : Color.clear)
                    .cornerRadius(8)
                    .fontWeight(.bold)
            }
            Button(action: {
                selectedFilter = "Ganado"
                applyFilter()
            }) {
                Text("Ganadas")
                    .foregroundColor(selectedFilter == "Ganado" ? .white : .black)
                    .padding(10)
                    .background(selectedFilter == "Ganado" ? Color.red : Color.clear)
                    .cornerRadius(8)
                    .fontWeight(.bold)
            }
            
            Button(action: {
                selectedFilter = "Perdido"
                applyFilter()
            }) {
                Text("Perdidas")
                    .foregroundColor(selectedFilter == "Perdido" ? .white : .red)
                    .padding(10)
                    .background(selectedFilter == "Perdido" ? Color.black : Color.clear)
                    .cornerRadius(8)
                    .fontWeight(.bold)
            }
        }
    }
}

//#Preview {
//    FilterBar()
//}

