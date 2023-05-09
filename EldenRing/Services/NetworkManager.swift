//
//  NetworkManager.swift
//  EldenRing
//
//  Created by Сазонов Станислав on 09.05.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    func fetchCharacter(completion: @escaping ([Character]) -> Void) {
        let urlAddress = "https://eldenring.fanapis.com/api/npcs"
        guard let url = URL(string: urlAddress) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            if let character = try? JSONDecoder().decode(CharacterInfo.self, from: data) {
                completion(character.data)
                print(character.data)
            } else {
                print("FAIL")
            }
        }.resume()
    }
}
