//
//  SpotifyAPIService.swift
//  trackback
//
//  Created by Adam Hacker on 7/19/25.
//

import Foundation

class SpotifyAPIService {
    
    static let api = SpotifyAPIService()
    
    private init() {}
    
    func fetchRecentlyPlayed(accessToken: String, completion: @escaping (Result<[String], Error>) -> Void) {
        
        guard let url = URL(string: "https://api.spotify.com/v1/me/player/recently-played") else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            
            
            completion(.success([String(data: data, encoding: .utf8) ?? "Bad data"]))
            
        }
        task.resume()
        
    }
    
}
