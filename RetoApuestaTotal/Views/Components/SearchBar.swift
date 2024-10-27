//
//  SearchBar.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Buscar por nombre del evento...", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
        }
    }
}

//#Preview {
//    SearchBar(text: )
//}
