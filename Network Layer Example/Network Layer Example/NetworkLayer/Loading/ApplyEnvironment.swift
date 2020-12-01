//
//  ApplyEnvironment.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 01/12/2020.
//

import Foundation

public class ApplyEnvironment: HTTPLoader {

    private let environment: ServerEnvironment

    public init(environment: ServerEnvironment) {
        self.environment = environment
        super.init()
    }

    override public func load(request: HTTPRequest, completion: @escaping (HTTPResult) -> Void) {
        var copy = request

        if copy.host!.isEmpty { //TODO : Force Unwraping
            copy.host = environment.host
        }
        if copy.path.hasPrefix("/") == false {
            // TODO: apply the environment.pathPrefix
        }
        // TODO: apply the query items from the environment
        for (header, value) in environment.headers {
            // TODO: add these header values to the request
        }

        super.load(request: copy, completion: completion)
    }
}
