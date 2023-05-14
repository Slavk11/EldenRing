//
//  CharacterCell.swift
//  EldenRing
//
//  Created by Сазонов Станислав on 09.05.2023.
//

import UIKit

final class CharacterCell: UITableViewCell {
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var characterLocationLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    
    func configure(with character: Character) {
        characterImage.contentMode = .scaleAspectFill
        
        characterNameLabel.text = character.name
        characterLocationLabel.text = "Location: \(character.location)"
        
        networkManager.fetchData(from: character.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


