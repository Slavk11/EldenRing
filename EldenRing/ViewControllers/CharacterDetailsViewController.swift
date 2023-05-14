//
//  CharacterDetailsViewController.swift
//  EldenRing
//
//  Created by Сазонов Станислав on 11.05.2023.
//

import UIKit

final class CharacterViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var characterDescriptionLabel: UILabel!
    @IBOutlet var characterPicture: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    
    // MARK: - Public properties
    var character: Character!
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    private var spinnerView = UIActivityIndicatorView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        characterDescriptionLabel.text = character.description
        characterNameLabel.text = character.name
        characterPicture.contentMode = .scaleAspectFill
        characterPicture.layer.cornerRadius = characterPicture.frame.height/2
        showSpinner(in: characterPicture)
        fetchImage()
    }
    
    // MARK: - Private Methods
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .white
        spinnerView.startAnimating()
        spinnerView.center = characterPicture.center
        spinnerView.hidesWhenStopped = true
        view.addSubview(spinnerView)
    }
    
    private func fetchImage() {
        networkManager.fetchData(from: character.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterPicture.image = UIImage(data: imageData)
                self?.spinnerView.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

