//
//  NetworkClientDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import SwiftyJSON

class NetworkClientDefault {

}

extension NetworkClientDefault: NetworkClient {
    
    func post(path: String, parameters: [String : Any]?, success: @escaping (JSON, HTTPURLResponse?) -> Void, failure: @escaping (Error) -> Void) {
        
    }
    
    func get(path: String, parameters: [String : Any]?, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
    }
    
    func put(path: String, parameters: [String : Any]?, success: @escaping (JSON, HTTPURLResponse?) -> Void, failure: @escaping (Error) -> Void) {
        
    }
}
