//
//  ViewController.swift
//  Networking
//
//  Created by Сазонов Станислав on 05.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNPC()
    }
    
    private func fetchNPC() {
        let urlAddress = "https://eldenring.fanapis.com/api/npcs"
        guard let url = URL(string: urlAddress) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
                
            }
            do {
                let decoder = JSONDecoder()
                let characterInfo = try decoder.decode(CharacterInfo.self, from: data)
                print(characterInfo)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


