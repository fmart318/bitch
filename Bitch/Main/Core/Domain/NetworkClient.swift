//
//  NetworkClient.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import SwiftyJSON

public protocol NetworkClient {
    func post(path: String, parameters: [String: Any]?, success: @escaping (_ json: JSON, _ response: HTTPURLResponse?) -> Void, failure: @escaping (Error) -> Void)
    func get(path: String, parameters: [String: Any]?, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void)
    func put(path: String, parameters: [String: Any]?, success: @escaping (_ json: JSON, _ response: HTTPURLResponse?) -> Void, failure: @escaping (Error) -> Void)
}
