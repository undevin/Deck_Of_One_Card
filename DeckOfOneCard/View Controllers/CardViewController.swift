//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Jared Warren on 12/18/19.
//  Copyright © 2019 Warren. All rights reserved.
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
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        // Request a card from the CardController
        CardController.fetchCard { [weak self] (result) in
            
            // Return to the main thread after a fetch
            DispatchQueue.main.async {
                
                // switch on "result" to handle both possibilities
                switch result {
                    
                    // if success, fetch the image
                case .success(let card):
                    self?.fetchImageAndUpdateView(with: card)
                    
                    // if failure, let the user know
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    // MARK: - Methods
    
    func fetchImageAndUpdateView(with card: Card) {
        
        // Request an image from the CardController
        CardController.fetchImage(for: card) { [weak self] (result) in
            
            // Return to main thread after a fetch
            DispatchQueue.main.async {
                
                // switch on "result" to handle both possibilities
                switch result {
                    
                    // if success, we now have everything we need to update the UI
                case .success(let image):
                    self?.cardLabel.text = "\(card.value) of \(card.suit)"
                    self?.cardImageView.image = image
                    
                    // if failure, let the user know
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
