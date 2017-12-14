//
//  Flavor.swift
//  PokeApi Client - JSON Decoder
//
//  Created by Tiago Santos on 14/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation

struct Flavor: Codable {
    let name: String?
    let url: String?
}

struct FlavorParent: Codable {
    let potency: Int?
    let flavor: Flavor?
}
