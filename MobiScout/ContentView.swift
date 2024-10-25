//
//  ContentView.swift
//  MobiScout
//
//  Created by Shiv Patel on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LoginView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Login")
                }
            
            RegisterView()
                .tabItem {
                    Image(systemName: "person.badge.plus")
                    Text("Register")
                }
            
            MainPageView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            LibraryView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
