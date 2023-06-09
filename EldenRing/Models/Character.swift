//
//  Anime.swift
//  Networking
//
//  Created by Сазонов Станислав on 05.05.2023.
//

import Foundation
struct EldenRing {
    let data: [Character]
}

struct Character {
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
        Location: \(location)
        Role: \(role ?? "No Role")
        Quote: \(quote ?? "No Quote")
        """
    }
    
    static func getCharacters(from value: Any) -> [Character] {
        guard let data = value as? [String: Any] else { return []}
        guard let charactersData = data["data"] as? [[String: Any]] else { return [] }
        return charactersData.map { Character(from: $0) }
    }
}






