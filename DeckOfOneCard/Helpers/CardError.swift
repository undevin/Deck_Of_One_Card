//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by Devin Flora on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Error. We are not able to connect to the server."
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "Error. The server responded with no data."
        case .unableToDecode:
            return "Error. The server sent back some bad data."
        }
    }
}//End of Enum
