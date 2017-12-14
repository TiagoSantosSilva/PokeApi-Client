//
//  ViewController.swift
//  PokeApi Client - JSON Decoder
//
//  Created by Tiago Santos on 14/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit
import Alamofire
import Moya

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performRequests()
    }
    
    func performRequests() {
        guard let requestUrl = URL(string: berryEndpoint) else { return }
        requestWithUrlSession(requestUrl: requestUrl)
        requestWithAlamofire(requestUrl: requestUrl)
    }
    
    func requestWithUrlSession(requestUrl: URL) {
        URLSession.shared.dataTask(with: requestUrl) { (data, response, err) in
            
            guard let data = data else { return }
            
            print("\n 🌞 URL Session & JSON Decoder 🌞")
            self.decodeWithJSONDecoder(data: data)
            }.resume()
    }
    
    func requestWithAlamofire(requestUrl: URL) {
        
        Alamofire.request(requestUrl).responseJSON(completionHandler: { (response) in
            
            if response.result.error == nil {
                
                guard let dictionary = response.result.value as? [String: Any] else { return }
                
                guard let jsonAsData = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else { return }
                
                print("\n 🏀 Alamofire & JSON Decoder 🏀")
                self.decodeWithJSONDecoder(data: jsonAsData)
            } else {
                debugPrint(response.result.error as Any)
            }
            })
    }
    
    func requestWithMoya(requestUrl: URL) {
        
        
    }
    
    func decodeWithJSONDecoder(data: Data) {
        do {
            let berry = try JSONDecoder().decode(Berry.self, from: data)
            print(berry)
            
        } catch let jsonErr {
            print("Error serializing json:", jsonErr)
        }
    }
}

