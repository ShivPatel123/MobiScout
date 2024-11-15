//
//  RegisterView.swift
//  MobiScout
//
//  Created by Shiv Patel
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
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
                    .padding(.bottom, 20)
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.semibold)
                
                // Input fields
                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                        .overlay(
                            Button(action: {
                                // Forgot password action
                            }) {
                                Text("Forgot Password?")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 8),
                            alignment: .trailing
                        )
                }
                
                // Login Button
                Button(action: {
                    // Login action
                }) {
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(hex: "8A7CFF"))
                        .cornerRadius(25)
                }
                .padding(.top, 8)
                
                // Sign Up Button
                Button(action: {
                    // Sign up action
                }) {
                    Text("SIGN UP")
                        .font(.headline)
                        .foregroundColor(Color(hex: "8A7CFF"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(hex: "8A7CFF"), lineWidth: 1)
                        )
                }
                
                Text("OR")
                    .foregroundColor(.gray)
                    .padding(.vertical, 16)
                
                // Google Sign In Button
                Button(action: {
                    // Google sign in action
                }) {
                    HStack {
                        Image("google-logo")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Sign in with Google")
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

// Custom TextField Style
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(16)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: .gray.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Color Extension for Hex Support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    LoginView()
}
