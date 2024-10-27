//
//  LoginView.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: BetViewModel
    @State private var correo: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Spacer()

                VStack {
                    Text("Bienvenido")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom, -80)
                    Image("apuesta-totallogin")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.8,
                               maxHeight: UIScreen.main.bounds.height * 0.3)
                        .padding(.bottom, -50)
                }
                
                VStack(spacing: 12) {
                    TextField("Correo", text: $correo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .padding(.horizontal, 24)
                        .onChange(of: correo) { newValue in
                            correo = newValue.lowercased()
                        }

                    SecureField("Contraseña", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 24)
                }
                .padding()

                Button(action: {
                    viewModel.loginUser(correo: correo, password: password)
                }) {
                    Text("Iniciar Sesión")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 40)
                }
                .padding(.top, 20)
                Spacer()
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding(.bottom, 150)
                }
            }
            .padding(.top, 50)
        }
    }
}

