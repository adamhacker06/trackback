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

    @State private var songs: [SongDTO] = []
    
    var body: some View {
        
        NavigationStack {
            
            List(songs) { song in
                VStack {
                    Text(song.name)
                    Text(song.createdAt.description)
                    Text(song.id.description)
                }
            }
            .task {
                await fetchSongs()
            }
            
        }
        
    }

    private func fetchSongs() async {
        do {
            let response: [SongDTO] = try await supabase
                .from("Songs")
                .select()
                .execute()
                .value
            
            self.songs = response
        }
        catch {
            print("Error with fetching songs")
        }
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
}
