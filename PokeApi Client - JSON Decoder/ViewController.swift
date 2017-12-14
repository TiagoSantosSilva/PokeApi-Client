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
        let requestClient = RequestClient(requestUrl: requestUrl)
        requestClient.requestWithUrlSession()
        requestClient.requestWithAlamofire()
        requestClient.requestWithMoya()
    }
}

