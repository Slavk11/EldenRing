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
        
        fetchAnime()
    }
    
    private func fetchAnime() {
        let urlAddress = "https://animechan.vercel.app/api/quotes/anime?title=naruto"
        guard let url = URL(string: urlAddress) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
                
            }
            do {
                let decoder = JSONDecoder()
                let anime = try decoder.decode([Anime].self, from: data)
                print(anime)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


