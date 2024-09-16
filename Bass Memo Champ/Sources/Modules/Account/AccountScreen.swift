//
//  AccountScreen.swift
//  Bass Memo Champ
//
//  Created by Андрей Сторожко on 09.09.2024.
//

import SwiftUI
import WebKit

struct AccountScreen: View {
    // MARK: - Setup
    @ObservedObject private var viewModel: AccountViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isPresentWebView = false
    @State private var showingLogOutAlert = false
    @State private var showingDeleteAlert = false
    
    init(viewModel: AccountViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        VStack(alignment: .center, spacing: 0) {
            Button(action: {
                dismiss()
            }, label: {
                Image("backButton")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .padding(.top, 48)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            Image("account")
                .resizable()
                .scaledToFit()
            VStack(alignment: .center, spacing: 12) {
                MainView(text: viewModel.name, style: .dark, layout: .main)
                MainView(text: viewModel.email, style: .light, layout: .main)
            }
            .padding(.horizontal, 12)
            VStack(spacing: 12) {
                MainButton(text: "LOG OUT", fullWidth: true, fontPalette: .sign, layout: .logOut, style: .additional, cornerRadius: 52) {
                    showingLogOutAlert = true
                }
                .alert(isPresented: $showingLogOutAlert) {
                    Alert(
                        title: Text("Log Out"),
                        message: Text("Are you sure you want to log out of your account?"),
                        primaryButton: .cancel(),
                        secondaryButton: .destructive(Text("Log Out"), action: {
                            viewModel.logOutButtonClicked()
                            dismiss()
                        })
                    )
                }
                MainButton(text: "DELETE", fullWidth: true, fontPalette: .sign, layout: .logOut, style: .main, cornerRadius: 52) {
                    showingDeleteAlert = true
                }
                .alert(isPresented: $showingDeleteAlert) {
                    Alert(
                        title: Text("Delete Account"),
                        message: Text("Are you sure you want to permanently delete your account? This action cannot be undone."),
                        primaryButton: .cancel(),
                        secondaryButton: .destructive(Text("Delete"), action: {
                            viewModel.deleteAccountButtonClicked()
                            dismiss()
                        })
                    )
                }
                Button(action: {
                    isPresentWebView = true
                }, label: {
                    Text("PRIVACY POLICY")
                        .underline()
                        .foregroundColor(.white)
                        .bold()
                })
                .padding(.top, 12)
                .padding(.horizontal, 24)
            }
            .padding(.top, 24)
            .padding(.horizontal, 48)
            .padding(.bottom, 60)
            .sheet(isPresented: $isPresentWebView) {
                NavigationStack {
                    WebView(url: URL(string: "https://sites.google.com/view/bass-memo-champ/privacy-policy?authuser=0")!)
                        .ignoresSafeArea()
                        .navigationTitle("Privacy Policy")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 48)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(
            Image("mainBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
        )
        .onAppear {
            viewModel.reloadDataSource()
        }
    }
}
    

#Preview {
    AccountScreen(viewModel: .init(id: "1", name: "Kukulaku", email: "xz@gmail.com"))
}

struct WebView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
