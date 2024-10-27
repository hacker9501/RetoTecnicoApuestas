//
//  MainView.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = BetViewModel()

    var body: some View {
        if viewModel.isLoggedIn {
            BetListView()
                .environmentObject(viewModel)
        } else {
            LoginView()
                .environmentObject(viewModel)
        }
    }
}
