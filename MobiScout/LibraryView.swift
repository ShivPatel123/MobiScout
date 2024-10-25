//
//  LibraryView.swift
//  MobiScout
//
//  Created by Shiv Patel
//

import SwiftUI

struct LibraryView: View {
    // Dummy data for the list items
    let libraryItems = [
        ("9/4/24", "6:35", "Ames, IA"),
        ("9/5/24", "7:12", "Ames, IA"),
        ("9/6/24", "2:15", "Ames, IA"),
        ("9/7/24", "8:09", "Ames, IA")
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("LIBRARY")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)
                
                List {
                    ForEach(libraryItems, id: \.0) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(item.0) at \(item.1)")
                                    .font(.headline)
                                Text(item.2)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: {
                                // Play video action here
                            }) {
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                }
                .listStyle(PlainListStyle()) // To reduce separator lines and keep a clean look
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LibraryView()
}
