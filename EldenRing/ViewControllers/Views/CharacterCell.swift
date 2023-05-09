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
    
    func configure(with character: Character) {
        characterNameLabel.text = character.name
        characterLocationLabel.text = character.location
        
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: character.image) else { return }
            DispatchQueue.main.async {
                self?.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}

