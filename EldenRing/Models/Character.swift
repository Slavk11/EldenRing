//
//  Anime.swift
//  Networking
//
//  Created by Сазонов Станислав on 05.05.2023.
//

import Foundation
struct EldenRing: Decodable {
    let data: [Character]
}

struct Character: Decodable {
    let name: String
    let image: String
    let location: String
    let role: String?
    let quote: String?
    
    init(name: String, image: String, location: String, role: String?, quote: String?) {
        self.name = name
        self.image = image
        self.location = location
        self.role = role
        self.quote = quote
    }
    init(from characterData: [String: Any]) {
    name = characterData["name"] as? String ?? ""
    image = characterData["image"] as? String ?? ""
    location = characterData["location"] as? String ?? ""
    role = characterData["role"] as? String ?? "No character role"
    quote = characterData["quote"] as? String ?? "No character quote"
    }
    
    var description: String {
            """
            Name:  \(name)
            Location:  \(location)
            Role:  \(role ?? "No Role")
            Quote: \(quote ?? "No Quote")
            """
    }
    
    static func getCharacters(from value: Any) -> [Character] {
        guard let charactersData = value as? [String: Any] else { return []}
        guard let data = charactersData["data"] as? [[String: Any]] else { return [] }
        return data.map { Character(from: $0) }
        }
    }






