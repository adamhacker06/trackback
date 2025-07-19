//
//  ContentView.swift
//  trackback
//
//  Created by Adam Hacker on 7/19/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @EnvironmentObject var spotifyController: SpotifyController
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            if spotifyController.isAuthorized {
                
                Text("Logged in to Spotify")
                Text("Access token: \(spotifyController.accessToken ?? "N/A")")
                Button("Log Out") {
                    spotifyController.disconnect()
                }
                
            } else {
                
                Text("Welcome to Trackback")
                Button("Connect to Spotify") {
                    spotifyController.connect()
                }
                
            }
            
        }
        .padding()
        
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environmentObject(SpotifyController())
}
