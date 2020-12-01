//
//  StarWardAPI.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 01/12/2020.
//

import Foundation

public class StarWarsAPI {
    
    private let loader: HTTPLoader? //TODO: Da li ovdje Optional da stavim

    public init(loader: HTTPLoader) {
        
        let modifier = ModifyRequest { request in
            var copy = request
            if copy.host!.isEmpty { //TODO: Force unwraping
                copy.host = "swapi.dev"
            }
            if copy.path.hasPrefix("/") == false {
                copy.path = "/api/" + copy.path
            }
            return copy
        }
        
        self.loader = modifier --> loader
    }

    public func requestPeople(completion: @escaping (HTTPResult) -> Void) {
        
        loader?.load(request: HTTPRequest(path: "people")) { result in
            // TODO: interpret the result
            completion(result)
        }
    }
}
