//
//  Anime.swift
//  Networking
//
//  Created by Сазонов Станислав on 05.05.2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let image: URL
    let location: String
    let role: String?
    let quote: String?
    
    var description: String {
            """
            Name:  \(name)
            Location:  \(location)
            Role:  \(role ?? "No Role")
            Quote: \(quote ?? "No Quote")
            """
    }
}

struct CharacterInfo: Decodable {
    let data: [Character]
}


