//
//  LibraryView.swift
//  MobiScout
//
//  Created by Shiv Patel
//

import SwiftUI

struct LibraryView: View {
    @State private var searchText = ""
    @State private var selectedItem: TripItem?
    
    // Sample data structure for trips
    struct TripItem: Identifiable {
        let id = UUID()
        let date: String
        let time: String
        let location: String
        let thumbnail: String // This would be a URL or asset name in production
        let duration: String
        let distance: String
    }
    
    // Sample data
    let trips = [
        TripItem(date: "9/4/24", time: "6:35", location: "Ames, IA", thumbnail: "trip1", duration: "25 min", distance: "12.5 mi"),
        TripItem(date: "9/5/24", time: "7:12", location: "Ames, IA", thumbnail: "trip2", duration: "32 min", distance: "15.8 mi"),
        TripItem(date: "9/6/24", time: "1:15", location: "Ames, IA", thumbnail: "trip3", duration: "18 min", distance: "8.2 mi"),
        TripItem(date: "9/7/24", time: "8:09", location: "Ames, IA", thumbnail: "trip4", duration: "45 min", distance: "22.3 mi")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Custom Navigation Bar
                    HStack {
                        Text("LIBRARY")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        // Profile Image
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color(hex: "8A7CFF"))
                    }
                    .padding()
                    
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search trips...", text: $searchText)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Trips List
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(trips) { trip in
                                TripItemView(trip: trip)
                                    .onTapGesture {
                                        selectedItem = trip
                                    }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .sheet(item: $selectedItem) { trip in
            TripDetailView(trip: trip)
        }
    }
}

// Trip Item Card View
struct TripItemView: View {
    let trip: LibraryView.TripItem
    
    var body: some View {
        HStack(spacing: 16) {
            // Thumbnail with play button overlay
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 80, height: 80)
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(hex: "8A7CFF"))
            }
            
            // Trip details
            VStack(alignment: .leading, spacing: 4) {
                Text("\(trip.date) at \(trip.time)")
                    .font(.headline)
                
                Text(trip.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Label(trip.duration, systemImage: "clock")
                    Spacer()
                    Label(trip.distance, systemImage: "map")
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Navigation indicator
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
}

// Trip Detail View
struct TripDetailView: View {
    @Environment(\.dismiss) var dismiss
    let trip: LibraryView.TripItem
    
    var body: some View {
        NavigationView {
            VStack {
                // Video Player Placeholder
                ZStack {
                    Color.black
                        .aspectRatio(16/9, contentMode: .fit)
                    
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                }
                
                // Trip Information
                List {
                    Section("Trip Details") {
                        DetailRow(title: "Date", value: trip.date)
                        DetailRow(title: "Time", value: trip.time)
                        DetailRow(title: "Location", value: trip.location)
                        DetailRow(title: "Duration", value: trip.duration)
                        DetailRow(title: "Distance", value: trip.distance)
                    }
                }
            }
            .navigationTitle("Trip Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// Detail Row Component
struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    LibraryView()
}
