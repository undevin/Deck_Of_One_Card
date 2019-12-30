//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Jared Warren on 12/18/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import Foundation

// The Swift models are a reflection of the JSON structure we receive from the server.
// We have to build out the top level in order to drill down to the Card object in the JSON.

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

