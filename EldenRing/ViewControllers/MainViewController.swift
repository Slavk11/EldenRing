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
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        guard let cell = cell as? CharacterCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailVC = segue.destination as? CharacterViewController else { return }
            detailVC.character = characters[indexPath.row]
        }
    }
}

    // MARK: - Networking
extension MainViewController {
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
   
    


