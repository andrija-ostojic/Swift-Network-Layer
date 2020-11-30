//
//  HTTPResult.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 30/11/2020.
//

import Foundation

public typealias HTTPResult = Result<HTTPResponse, HTTPError>

extension HTTPResult {
    
    public var request: HTTPRequest {
        switch self {
            case .success(let response): return response.request
            case .failure(let error): return error.request
        }
    }
    
    public var response: HTTPResponse? {
        switch self {
            case .success(let response): return response
            case .failure(let error): return error.response
        }
    }
    
}
