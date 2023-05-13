//
//  CharacterDetailsViewController.swift
//  EldenRing
//
//  Created by Сазонов Станислав on 11.05.2023.
//

import UIKit

final class CharacterViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var characterNameLabel: UILabel!
   
    @IBOutlet var characterPicture: UIImageView!
    
    // MARK: - Public properties
    var character: Character!
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    private var spinnerView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterNameLabel.text =  """
        Name:  \(character.name)
        Location:  \(character.location)
        Role:  \(character.role ?? "No Role")
        Quote: \(character.quote ?? "No Quote")
        """
        characterPicture.contentMode = .scaleAspectFill
        characterPicture.layer.cornerRadius = characterPicture.frame.height/2
        fetchImage()
    }
    
    private func fetchImage() {
        networkManager.fetchImage(from: character.image) { result in
            switch result {
            case .success(let imageData):
                self.characterPicture.image = UIImage(data: imageData)
                self.spinnerView.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}

