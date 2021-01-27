//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Devin Flora on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: UIButton) {
        CardController.fetchCard { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(card: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    func fetchImageAndUpdateViews(card: Card) {
        CardController.fetchImage(card: card) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.cardLabel.text = "\(card.value) of \(card.suit)"
                    self?.cardImageView.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}//End of Class
