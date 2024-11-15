//
//  MainPageView.swift
//  MobiScout
//
//  Created by Shiv Patel
//

import SwiftUI
import MapKit

struct MainPageView: View {
    @State private var selectedTab = 0
    @State private var currentSpeed: Double = 35.0
    @State private var isRecording = false
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.0308, longitude: -93.6319), // Ames, IA coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    private let tabItems = ["Watch", "Current Speed", "New Trip", "Chart"]
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // Top Tab Bar
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<tabItems.count, id: \.self) { index in
                            Button(action: {
                                withAnimation {
                                    selectedTab = index
                                }
                            }) {
                                Text(tabItems[index])
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(selectedTab == index ? .white : .primary)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        Capsule()
                                            .fill(selectedTab == index ? Color(hex: "8A7CFF") : Color.gray.opacity(0.1))
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                
                // Video Preview with Speed Overlay
                ZStack(alignment: .bottom) {
                    // Video Preview
                    ZStack {
                        Color.black
                            .aspectRatio(16/9, contentMode: .fit)
                            .cornerRadius(16)
                        
                        // Camera preview placeholder
                        Image(systemName: "video.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .foregroundColor(.gray)
                        
                        // Record Button Overlay
                        VStack {
                            Spacer()
                            Button(action: {
                                isRecording.toggle()
                            }) {
                                Circle()
                                    .fill(isRecording ? Color.red : Color.green)
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Image(systemName: isRecording ? "stop.fill" : "play.fill")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                    )
                            }
                            .padding(.bottom, 20)
                        }
                    }
                    
                    // Speed Indicator Overlay
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Current Speed:")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text("\(Int(currentSpeed)) mph")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black.opacity(0.6))
                        )
                        Spacer()
                    }
                    .padding()
                }
                .padding(.horizontal)
                
                // Map View
                Map(coordinateRegion: $region)
                    .frame(height: 200)
                    .cornerRadius(16)
                    .padding(.horizontal)
                
//                // Bottom Navigation Bar
//                HStack(spacing: 0) {
//                    ForEach(["play.circle.fill", "map.fill", "location.fill", "chart.line.uptrend.xyaxis"], id: \.self) { iconName in
//                        Button(action: {
//                            // Handle tab selection
//                        }) {
//                            VStack(spacing: 4) {
//                                Image(systemName: iconName)
//                                    .font(.title2)
//                                Text(tabTitle(for: iconName))
//                                    .font(.caption2)
//                            }
//                            .foregroundColor(Color(hex: "8A7CFF"))
//                            .frame(maxWidth: .infinity)
//                        }
//                    }
//                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
    }
    
    private func tabTitle(for icon: String) -> String {
        switch icon {
        case "play.circle.fill": return "Monitor"
        case "map.fill": return "Library"
        case "location.fill": return "Location"
        case "chart.line.uptrend.xyaxis": return "Stats"
        default: return ""
        }
    }
}

// Speed Gauge View
struct SpeedGaugeView: View {
    let speed: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: min(speed / 100, 1.0))
                .stroke(
                    speed > 65 ? Color.red :
                        speed > 45 ? Color.orange : Color.green,
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.spring(), value: speed)
            
            VStack {
                Text("\(Int(speed))")
                    .font(.system(size: 48, weight: .bold))
                Text("MPH")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

// Preview
#Preview {
    MainPageView()
}
