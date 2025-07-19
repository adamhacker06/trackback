//
//  trackbackApp.swift
//  trackback
//
//  Created by Adam Hacker on 7/19/25.
//

import SwiftUI
import SwiftData
import Supabase

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://tixhokkamvoyzlihvtoo.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpeGhva2thbXZveXpsaWh2dG9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI5NTI0ODksImV4cCI6MjA2ODUyODQ4OX0.kAfF9ES_0kCpCz_uInwjpkc9bh6oQ8FQcURUNiPn85k"
)

@main
struct trackbackApp: App {
    
    @StateObject private var spotifyController = SpotifyController()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(spotifyController)
                .onOpenURL(perform: { url in
                    spotifyController.handleURL(url)
                })
        }
        .modelContainer(sharedModelContainer)
    }
}
