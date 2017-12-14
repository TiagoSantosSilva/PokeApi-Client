//
//  MoyaLayer.swift
//  PokeApi Client - JSON Decoder
//
//  Created by Tiago Santos on 14/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation
import Moya

enum MyServerAPI {
    
    case berries
    case berryById(berryId: String)
    
    case createBerry(berry: Berry) // won't work since the PokeAPI doesn't support POST, just here for academic purpose.
}

extension MyServerAPI: TargetType {
    var path: String {
        switch self {
        case .berries:
            return "berries" // won't work. 😅 PokeApi doesn't have a GET all for berries.
        case .berryById(let berryId):
            return "berry/\(berryId)"
        case .createBerry( _):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createBerry( _):
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL { return URL(string: pokeApi)! }
}
