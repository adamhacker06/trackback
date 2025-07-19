//
//  Song.swift
//  trackback
//
//  Created by Adam Hacker on 7/19/25.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: Int
    let createdAt: Date
    let name: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case createdAt = "created_at"
        case name
        
    }
    
}
