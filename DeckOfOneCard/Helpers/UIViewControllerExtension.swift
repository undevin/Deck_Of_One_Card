//
//  UIViewControllerExtension.swift
//  DeckOfOneCard
//
//  Created by Jared Warren on 12/18/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import UIKit

// Recommend they create a snippet.
extension UIViewController {
    
    // Has to be a LocalizedError so we can print the error.errorDescription.
    // As of Swift 5.1, ".localizedDescription" still ignores custom descriptions. Probably a bug.
    func presentErrorToUser(localizedError: LocalizedError) {
        
        let alertController = UIAlertController(title: "ERROR", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
