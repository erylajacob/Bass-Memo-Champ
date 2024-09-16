//
//  RegistrationScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct RegistrationScreen: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            VStack(alignment: .center, spacing: 24) {
                MainTextField(text: $viewModel.name, placeholder: "NAME")
                MainTextField(text: $viewModel.email, placeholder: "EMAIL")
                    .keyboardType(.emailAddress)
                SecureTextField(text: $viewModel.password, placeholder: "PASSWORD", style: .dark)
                SecureTextField(text: $viewModel.confirmPassword, placeholder: "Confirm password", style: .light)
            }
                        
            MainButton(text: "SIGN UP", fontPalette: .sign, layout: .logOut, style: .main, cornerRadius: 52) {
                    viewModel.signUpButtonClicked()
                }
            .padding(.top, 36)
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("SOMETHING WENT WRONG."), message: Text("AUTHENTICATION ERROR. PLEASE CHECK YOUR CREDENTIALS AND TRY AGAIN."), dismissButton: .default(Text("OK")))
                }
            Button(action: {
                dismiss()
            }) {
                VStack {
                    Text("DO YOU ALREADY HAVE AN ACCOUNT?")
                        .foregroundColor(.white)
                        .bold()
                        .font(.footnote)
                    Text("SIGN IN")
                        .underline()
                        .foregroundColor(.white)
                        .bold()
                        .font(.footnote)
                }
                .padding(.top, 50)
                .padding(.bottom, 60)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.horizontal, 32)
        .ignoresSafeArea(.keyboard, edges: .all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("mainBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        )
        .onDisappear {
            viewModel.clearState()
        }
    }
}

#Preview {
    RegistrationScreen(viewModel: .init(name: "", email: "", password: "", path: .constant(.init())))
}
