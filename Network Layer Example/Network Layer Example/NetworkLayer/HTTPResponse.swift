//
//  HTTPResponse.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 30/11/2020.
//

import Foundation

public struct HTTPResponse {
    
    public let request: HTTPRequest
    public let response: HTTPURLResponse //TODO: An issue appeared with this having private access level, because then the initializer is inaccessible
    public let body: Data?
        
    public var status: HTTPStatus {
        // A struct of similar construction to HTTPMethod
        HTTPStatus(rawValue: response.statusCode)
    }

    public var message: String {
        HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
    }

    public var headers: [AnyHashable: Any] { response.allHeaderFields }
}
