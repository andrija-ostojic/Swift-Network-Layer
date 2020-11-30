//
//  HTTPLoading.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 30/11/2020.
//

import Foundation

open class HTTPLoader {

    public var nextLoader: HTTPLoader? {
        willSet {
            guard nextLoader == nil else { fatalError("The nextLoader may only be set once") }
        }
    }

    public init() { }

    open func load(request: HTTPRequest, completion: @escaping (HTTPResult) -> Void) {

        if let next = nextLoader {
            next.load(request: request, completion: completion)
        } else {
            let error = HTTPError(code: .cannotConnect, request: request, response: nil, underlyingError: nil)
            completion(.failure(error))
        }

    }
}
