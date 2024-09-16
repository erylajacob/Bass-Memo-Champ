//
//  AuthorizationScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI

struct AuthorizationScreen: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: AuthorizationViewModel
    @Binding private var path: NavigationPath
    @State private var showingAlert = false
    
    init(viewModel: AuthorizationViewModel, path: Binding<NavigationPath>) {
        self.viewModel = viewModel
        self._path = path
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image("account")
                .resizable()
                .scaledToFit()
            VStack(alignment: .center, spacing: 24) {
                MainTextField(text: $viewModel.email, placeholder: "EMAIL")
                    .keyboardType(.emailAddress)
                SecureTextField(text: $viewModel.password, placeholder: "PASSWORD", style: .light)
            }
            MainButton(text: "ANONYMOUS LOGIN", fontPalette: .sign, layout: .regular, style: .additional, cornerRadius: 52) {
                viewModel.anonymousLogin()
            }
            .padding(.horizontal, 24)
            MainButton(text: "SIGN IN", fontPalette: .sign, layout: .logOut, style: .main, cornerRadius: 52) {
                viewModel.signInButtonClicked()
            }
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("SOMETHING WENT WRONG."), message: Text("AUTHENTICATION ERROR. PLEASE CHECK YOUR CREDENTIALS AND TRY AGAIN."), dismissButton: .default(Text("OK")))
            }
            Button(action: {
                path.append(MainRouting.registation)
            }) {
                VStack {
                    Text("YOU DON'T HAVE AN ACCOUNT YET?")
                        .foregroundColor(.white)
                        .bold()
                        .font(.footnote)
                    HStack {
                        Text("SIGN UP")
                            .underline()
                            .foregroundColor(.white)
                            .bold()
                            .font(.footnote)
                        Text("NOW?")
                            .foregroundColor(.white)
                            .bold()
                            .font(.footnote)
                    }
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
                .ignoresSafeArea(edges: .all)
        )
        .onDisappear {
            viewModel.clearState()
        }
    }
}

#Preview {
    AuthorizationScreen(viewModel: .init(email: "email", password: ""), path: .constant(.init()))
}
