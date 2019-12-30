//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Jared Warren on 12/18/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

// Our Swift models reflect the JSON structure.
// We have to build out TopLevelObject in order to drill down to Card.

// The top level JSON object.
struct TopLevelObject: Decodable {
    let cards: [Card]
}

// Our model.
struct Card: Decodable {
    let image: URL
    let value: String
    let suit: String
}

