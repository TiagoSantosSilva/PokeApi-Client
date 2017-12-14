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
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] else { return }
        
        guard let id = dictionary["id"] as? Int else { return }
        guard let name = dictionary["name"] as? String else { return }
        guard let size = dictionary["size"] as? Int else { return }
        
        print("Id: \(id) \nName: \(name) \nSize: \(size)")
    }
    
    class func decodeWithSwiftyJSON(data: Data, messageToPrint: String) {
        print(messageToPrint)
    }
}
