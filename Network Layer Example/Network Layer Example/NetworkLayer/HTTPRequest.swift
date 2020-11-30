//
//  HTTPRequest.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 30/11/2020.
//

import Foundation

public struct HTTPRequest {
    // components are private so that we can selectively expose portions of them
    private var urlComponents = URLComponents()
    
    public var method: HTTPMethod = .get
    // not exactly right to user dictionary since headers are case insensitive
    public var headers: [String: String] = [:]
    public var body: HTTPBody = EmptyBody()

    public init() {
        urlComponents.scheme = "https"
    }
}

extension HTTPRequest {

    public var scheme: String { urlComponents.scheme ?? "https" }
    
    public var host: String? {
        get { urlComponents.host }
        set { urlComponents.host = newValue }
    }
    
    public var path: String {
        get { urlComponents.path }
        set { urlComponents.path = newValue }
    }

    public var url: URL? {
        get {
            return urlComponents.url
        }
    }
    
}
