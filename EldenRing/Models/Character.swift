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
}

struct CharacterInfo: Decodable {
    let data: [Character]
    
}
