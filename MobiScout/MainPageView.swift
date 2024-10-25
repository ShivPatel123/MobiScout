//
//  MainPageView.swift
//  MobiScout
//
//  Created by Shiv Patel
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        VStack {
            // Header with tabs for navigation
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Text("Watch")
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    
                    Text("Current Speed")
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    
                    Text("Map")
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)

                    Text("Chart")
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            
            Spacer().frame(height: 20)
            
            // Video section (image placeholder for now)
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .cornerRadius(15)
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.green)
            }
            .padding(.horizontal)

            Spacer().frame(height: 20)
            
            // Current Speed Indicator
            VStack {
                Text("Current Speed:")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Text("35 mph")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(15)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    MainPageView()
}
