//
//  LoginView.swift
//  MobiScout
//
//  Created by Shiv Patel
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 30)

            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)

            Button(action: {
                // Login action here
            }) {
                Text("LOGIN")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            HStack {
                Text("Don't have an account?")
                Button(action: {
                    // Navigate to register view
                }) {
                    Text("SIGN UP")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
