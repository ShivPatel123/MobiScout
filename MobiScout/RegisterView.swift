//
//  RegisterView.swift
//  MobiScout
//
//  Created by Shiv Patel
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingTerms = false
    @State private var hasAcceptedTerms = false
    
    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "8A7CFF").opacity(0.3), .white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Logo
                Image("mobiscout-logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.top, 40)
                
                Text("Register")
                    .font(.title)
                    .fontWeight(.semibold)
                
                // Input fields
                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(CustomTextFieldStyle())
                }
                
                // Terms Agreement
                Button(action: {
                    showingTerms = true
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: hasAcceptedTerms ? "checkmark.square.fill" : "square")
                            .foregroundColor(Color(hex: "8A7CFF"))
                        Text("I agree to these terms")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 8)
                
                // Register Button
                Button(action: {
                    // Register action
                }) {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(hex: "8A7CFF"))
                        .cornerRadius(25)
                }
                .disabled(!hasAcceptedTerms)
                .opacity(hasAcceptedTerms ? 1 : 0.6)
                
                // Sign In Link
                Button(action: {
                    // Navigate to sign in
                }) {
                    Text("SIGN IN")
                        .font(.headline)
                        .foregroundColor(Color(hex: "8A7CFF"))
                }
                .padding(.top, 8)
                
                Spacer()
            }
            .padding(.horizontal, 24)
            
            // Terms of Use Sheet
            .sheet(isPresented: $showingTerms) {
                TermsOfUseView(hasAcceptedTerms: $hasAcceptedTerms)
            }
        }
    }
}

// Terms of Use View
struct TermsOfUseView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var hasAcceptedTerms: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Terms Of Use")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    
                    Text("""
                    These Terms of Use constitute a legally binding agreement made between you, whether personally or on behalf of an entity ("you") and business entity name ("we," "us" or "our"), concerning your access to and use of the [website name].com website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto.
                    
                    You agree that by accessing the Site, you have read, understood, and agree to be bound by all of these Terms of Use.
                    """)
                    .font(.body)
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("DECLINE")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(25)
                        }
                        
                        Button(action: {
                            hasAcceptedTerms = true
                            dismiss()
                        }) {
                            Text("ACCEPT")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color(hex: "8A7CFF"))
                                .cornerRadius(25)
                        }
                    }
                }
                .padding(24)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Reuse the CustomTextFieldStyle and Color extension from LoginView

#Preview {
    RegisterView()
}
