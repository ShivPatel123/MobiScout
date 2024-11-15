//
//  MainTabView.swift
//  MobiScout
//
//  Created by Shiv Patel
//


import SwiftUI

// Main Tab View to handle navigation
struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainPageView()
                .tabItem {
                    Label("Monitor", systemImage: "video.fill")
                }
                .tag(0)
            
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "folder.fill")
                }
                .tag(1)
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
                .tag(2)
            
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
        }
        .tint(Color(hex: "8A7CFF"))
    }
}

// Settings View
struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var autoUploadEnabled = true
    @State private var selectedQuality = "High"
    @State private var maxStorageGB = 10.0
    @State private var showingProfileSheet = false
    
    let videoQualities = ["Low", "Medium", "High"]
    
    var body: some View {
        NavigationView {
            List {
                // Profile Section
                Section {
                    Button(action: { showingProfileSheet = true }) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(hex: "8A7CFF"))
                            
                            VStack(alignment: .leading) {
                                Text("John Doe")
                                    .font(.headline)
                                Text("john.doe@email.com")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading, 8)
                        }
                    }
                }
                
                // Recording Settings
                Section(header: Text("Recording Settings")) {
                    Picker("Video Quality", selection: $selectedQuality) {
                        ForEach(videoQualities, id: \.self) { quality in
                            Text(quality)
                        }
                    }
                    
                    Toggle("Auto-Upload Videos", isOn: $autoUploadEnabled)
                    
                    VStack(alignment: .leading) {
                        Text("Maximum Storage (\(Int(maxStorageGB)) GB)")
                        Slider(value: $maxStorageGB, in: 1...50, step: 1)
                    }
                }
                
                // App Settings
                Section(header: Text("App Settings")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                    
                    NavigationLink("Privacy Settings") {
                        PrivacySettingsView()
                    }
                    
                    NavigationLink("Bluetooth Devices") {
                        BluetoothSettingsView()
                    }
                }
                
                // Support & Info
                Section(header: Text("Support & Info")) {
//                    NavigationLink("Help Center") {
//                        HelpCenterView()
//                    }
//                    
//                    NavigationLink("About MobiScout") {
//                        AboutView()
//                    }
                    
                    Button(action: {
                        // Handle logout
                    }) {
                        Text("Log Out")
                            .foregroundColor(.red)
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Text("Version 1.0.0")
                            .foregroundColor(.gray)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $showingProfileSheet) {
            ProfileEditView()
        }
    }
}

// Additional Settings Related Views
struct PrivacySettingsView: View {
    @State private var locationEnabled = true
    @State private var analyticsEnabled = true
    @State private var dataSharing = true
    
    var body: some View {
        List {
            Section(header: Text("Privacy Options")) {
                Toggle("Location Services", isOn: $locationEnabled)
                Toggle("Analytics", isOn: $analyticsEnabled)
                Toggle("Data Sharing", isOn: $dataSharing)
            }
            
            Section(header: Text("Data Management")) {
                Button("Delete All Recordings") {
                    // Handle deletion
                }
                .foregroundColor(.red)
                
                Button("Export My Data") {
                    // Handle data export
                }
            }
        }
        .navigationTitle("Privacy Settings")
    }
}

struct BluetoothSettingsView: View {
    @State private var isScanning = false
    @State private var devices = ["OBD Device 1", "OBD Device 2"]
    
    var body: some View {
        List {
            Section(header: Text("Connected Devices")) {
                ForEach(devices, id: \.self) { device in
                    HStack {
                        Text(device)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
            }
            
            Section {
                Button(action: { isScanning.toggle() }) {
                    HStack {
                        Text(isScanning ? "Stop Scanning" : "Scan for Devices")
                        if isScanning {
                            Spacer()
                            ProgressView()
                        }
                    }
                }
            }
        }
        .navigationTitle("Bluetooth Devices")
    }
}

// Simple placeholder views for other sections
struct StatsView: View {
    var body: some View {
        Text("Stats View")
            .navigationTitle("Statistics")
    }
}

struct ProfileEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = "John Doe"
    @State private var email = "john.doe@email.com"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Information")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarItems(
                trailing: Button("Done") {
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    MainTabView()
}
