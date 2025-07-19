//
//  SongListTestView.swift
//  trackback
//
//  Created by Adam Hacker on 7/19/25.
//

import SwiftUI

struct SongListTestView: View {
    
    @State private var songs: [Song] = []
    
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
            let response: [Song] = try await supabase
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
    
}

#Preview {
    SongListTestView()
}
