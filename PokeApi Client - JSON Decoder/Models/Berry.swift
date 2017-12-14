//
//  Pokemon.swift
//  PokeApi Client - JSON Decoder
//
//  Created by Tiago Santos on 14/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation

struct Berry: Codable {
    let id: Int?
    let name: String?
    let growth_time: Int?
    let max_harvest: Int?
    let natural_gift_power: Int?
    let size: Int?
    let smoothness: Int?
    let soil_dryness: Int?
    let firmness: Firmness?
    let flavors: [FlavorParent]?
    let item: Item?
    let natural_gift_type: NaturalGiftType?
}
