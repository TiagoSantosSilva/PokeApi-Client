//
//  JSONCoder.swift
//  PokeApi Client - JSON Decoder
//
//  Created by Tiago Santos on 14/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation

class JSONCoder {
    
    class func decodeWithJSONDecoder(data: Data, messageToPrint: String) {
        do {
            print(messageToPrint)
            let berry = try JSONDecoder().decode(Berry.self, from: data)
            print(berry)
            
        } catch let jsonErr {
            print("Error serializing json:", jsonErr)
        }
    }
    
    class func decodeWithNativeDecoder(data: Data, messageToPrint: String) {
        print(messageToPrint)
    }
    
    class func decodeWithSwiftyJSON(data: Data, messageToPrint: String) {
        print(messageToPrint)
    }
}
