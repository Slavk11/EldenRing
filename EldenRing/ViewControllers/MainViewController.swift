//
//  ViewController.swift
//  Networking
//
//  Created by Сазонов Станислав on 05.05.2023.
//

import UIKit

final class MainViewController: UITableViewController {
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
        fetchCharacter()
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        guard let cell = cell as? CharacterCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    private func fetchCharacter() {
        NetworkManager.shared.fetchCharacter { [weak self] values in
            guard let self else { return }
            DispatchQueue.main.async {
                self.characters = values
                self.tableView.reloadData()
            }
        }
    }
    
}




