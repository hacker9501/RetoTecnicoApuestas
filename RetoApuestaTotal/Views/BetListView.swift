//
//  BetListView.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct BetListView: View {
    @StateObject private var viewModel = BetViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding()
                    .onChange(of: viewModel.searchText) { _ in
                        viewModel.applyFilter()
                    }
                
                FilterBar(selectedFilter: $viewModel.selectedFilter, applyFilter: viewModel.applyFilter)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredBets) { bet in
                            BetCardView(betDetail: bet)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .background(Color(UIColor.systemGray6))
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 20) {
                        Text("Historial")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.top, 110)
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 150)
                            .padding(.top, -60)
                    }
                }
            }
        }
    }
}


#Preview {
    BetListView()
}
