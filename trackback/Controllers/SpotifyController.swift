//
//  SpotifyController.swift
//  trackback
//
//  Created by Adam Hacker on 7/19/25.
//

import SwiftUI
import Combine
import SpotifyiOS

class SpotifyController: NSObject, ObservableObject {
    
    let spotifyClientID: String = "fdf948a35a774fdeaeec466970b25b9c"
    let spotifyRedirectURL: URL = URL(string: "trackback://spotify-login-callback/")!
    
    @Published var accessToken: String?
    @Published var isAuthorized: Bool = false
    
    private var appRemote: SPTAppRemote?
    private var sessionManager: SPTSessionManager?
    
    private var connectionRequest: AnyCancellable?
    
    func connect() {
        let configuration = SPTConfiguration(
            clientID: spotifyClientID,
            redirectURL: spotifyRedirectURL
        )
        
        configuration.playURI = ""
        self.sessionManager = SPTSessionManager(configuration: configuration, delegate: self)
        
        let scopes: SPTScope = [.userReadEmail, .userReadPrivate, .userTopRead, .playlistReadPrivate, .streaming, .userReadRecentlyPlayed]
        
        sessionManager?.initiateSession(with: scopes, options: .default, campaign: Bundle.main.bundleIdentifier ?? "trackback-app")
        
    }
    
    func disconnect() {
        
        if appRemote?.isConnected == true {
            appRemote?.disconnect()
        }
        self.isAuthorized = false
        self.accessToken = nil
        
    }
    
    func handleURL(_ url: URL) {
        self.sessionManager?.application(UIApplication.shared, open: url, options: [:])
    }
    
}

extension SpotifyController: SPTSessionManagerDelegate {
    
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        
        DispatchQueue.main.async {
            print("SUCCESS: Session initatied")
            self.accessToken = session.accessToken
            self.isAuthorized = true
        }
        
    }
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: any Error) {
        
        DispatchQueue.main.async {
            print("FAILURE: Session failed to initiatie: \(error.localizedDescription)")
            self.isAuthorized = false
        }
        
    }

}

extension SpotifyController: SPTAppRemoteDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        print("SUCCESS: App remote connected")
        self.appRemote = appRemote
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: (any Error)?) {
        print("FAILURE: Failed to conneect to app remote")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: (any Error)?) {
        print("NOTIF: App remote disconnected")
    }
}
