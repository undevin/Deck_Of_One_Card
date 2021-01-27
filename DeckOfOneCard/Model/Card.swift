//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Devin Flora on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
}//End of Struct

struct TopLevelObject: Decodable {
    let cards: [Card]
}
