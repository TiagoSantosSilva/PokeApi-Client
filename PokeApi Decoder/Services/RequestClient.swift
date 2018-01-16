//
//  RequestClient.swift
//  PokeApi Client - JSON Decoder
//
//  Created by Tiago Santos on 14/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class RequestClient {
    
    let requestUrl: URL
    
    init(requestUrl: URL){
        self.requestUrl = requestUrl
    }
    
    func requestWithUrlSession() {
        URLSession.shared.dataTask(with: self.requestUrl as URL) { (data, response, err) in
            
            guard let data = data else { return }
            
            JSONCoder.decodeWithJSONDecoder(data: data, messageToPrint: "\n 🌞 URL Session & JSON Decoder 🌞")
            JSONCoder.decodeWithNativeDecoder(data: data, messageToPrint: "\n 🌚 URL Session & Native Decoder 🌚")
            JSONCoder.decodeWithSwiftyJSON(data: data, messageToPrint: "\n ☃️ URL Session & Swifty JSON ☃️")
            }.resume()
    }
    
    func requestWithAlamofire() {
        
        Alamofire.request(self.requestUrl).responseJSON(completionHandler: { (response) in
            
            if response.result.error == nil {
                
                guard let dictionary = response.result.value as? [String: Any] else { return }
                
                guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else { return }
                
                JSONCoder.decodeWithJSONDecoder(data: data, messageToPrint: "\n ⚽️ Alamofire & JSON Decoder ⚽️")
                JSONCoder.decodeWithNativeDecoder(data: data, messageToPrint: "\n 🏀 Alamofire & Native Decoder 🏀")
                JSONCoder.decodeWithSwiftyJSON(data: data, messageToPrint: "\n 🎾 Alamofire & Swifty JSON 🎾")
            } else {
                debugPrint(response.result.error as Any)
            }
        })
    }
    
    func requestWithMoya() {
        let provider = MoyaProvider<MyServerAPI>()
        provider.request(.berryById(berryId: "1")) { (result) in
            switch result {
            case .success( _):
                guard let data = result.value?.data else { return }
                
                JSONCoder.decodeWithJSONDecoder(data: data, messageToPrint: "\n 🍏 Moya & JSON Decoder 🍏")
                JSONCoder.decodeWithNativeDecoder(data: data, messageToPrint: "\n 🍋 Moya & Native Decoder 🍋")
                JSONCoder.decodeWithSwiftyJSON(data: data, messageToPrint: "\n 🍊 Moya & Swifty JSON 🍊")
            case .failure( _):
                print("Request didn't succeed.")
            }
        }
    }
}
