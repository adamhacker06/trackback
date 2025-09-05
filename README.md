# Trackback

**Relive your moments through music. The official soundtrack to your life's events.**

> ⚠️ **Work in Progress**: Please note that Trackback is a personal project currently under active development. Its main purpose is to explore and implement modern development techniques in SwiftUI, backend services, and API integration. Most features are incomplete or in the planning stage.

## Core Concept

Trackback is a personal project I'm developing to explore the deep connection between music and memory. The idea is to build an app that solves a personal problem: the specific songs that define a shared experience—a road trip, a party, a vacation—are often forgotten. The goal is to create a social app that can automatically capture the musical soundtrack of an event by linking to the Spotify accounts of everyone involved.

## Features

### ✅ Implemented

- **Spotify Authentication**: Securely connect a user's Spotify account using OAuth 2.0 with proper OAuth 2.0 flow
- **Basic API Integration**: Foundation for fetching recently played tracks from Spotify API (returns raw JSON)
- **SwiftData Framework**: Local data persistence framework configured but not yet integrated into UI
- **Supabase Configuration**: Backend service configured and ready for data operations

### 🏗️ In Progress / Planned

- **Data Parsing & Models**: Converting raw Spotify API responses into structured Song objects
- **SwiftData Integration**: Actually using SwiftData to store and display song data in the UI
- **Local-Cloud Sync**: Implementing data synchronization between SwiftData and Supabase
- **Event Creation**: Basic ability to create a named event with a start and end date/time
- **Social Invites**: A system for users to invite friends to an event
- **Group Data Aggregation**: A backend service to collect and combine listening data from all event participants
- **Post-Event Analytics**: The dashboard with fun stats like "Top DJ" and the "Event Anthem"
- **Generated "Memory Mix"**: Automatically creating a Spotify playlist from the event's track history
- **User Profiles & Event History**: A view for users to see their past events

## My Tech Stack

- **Frontend**: SwiftUI
- **Platform**: iOS 17+
- **Backend**: Supabase
- **Local Storage**: SwiftData
- **External APIs**: Spotify Web API
- **Authentication**: Spotify OAuth 2.0

## Running the Project

As this project is in development, these steps may change.

### Prerequisites
- Xcode 15+
- Swift 5.9+
- iOS 17+ device or simulator

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/[your-username]/Trackback.git
   ```

2. **Environment Variables**: Create a `Secrets.xcconfig` file with the following template:
   ```
   SPOTIFY_CLIENT_ID = "YOUR_SPOTIFY_CLIENT_ID"
   SPOTIFY_CLIENT_SECRET = "YOUR_SPOTIFY_CLIENT_SECRET"
   SUPABASE_URL = "YOUR_SUPABASE_URL"
   SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_KEY"
   ```

3. **Dependencies & Running**: 
   - Open `trackback.xcodeproj` in Xcode
   - Install dependencies via Swift Package Manager
   - Build and run on your preferred iOS device or simulator

## Key Technical Challenges & Learnings

A primary challenge in this project is managing the asynchronous nature of API calls to Spotify for multiple users in an event. The backend logic needs to efficiently poll for updates without hitting API rate limits. I am also focusing on implementing a secure and user-friendly OAuth 2.0 flow, which is a critical component of any modern social application. Additionally, learning to balance local data storage with cloud synchronization using SwiftData and Supabase has provided valuable experience in modern iOS development patterns.

## Long-Term Vision

- ⏳ **Time Capsule Mode**: Locking a playlist to be revealed on a future anniversary
- 🍎 **Multi-Platform Support**: Integrating Apple Music and other services
- 📸 **Multimedia Memories**: Syncing photos from an event to the music that was playing at the time
- 🤖 **AI-Powered Insights**: Using machine learning to identify the "mood" of an event based on music choices
- 🌍 **Global Events**: Supporting large-scale events like concerts and festivals
- 📊 **Advanced Analytics**: Deep insights into music trends and personal listening patterns

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

