//
//  ModifyRequest.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 01/12/2020.
//

import Foundation

public class ModifyRequest: HTTPLoader {

    private let modifier: (HTTPRequest) -> HTTPRequest

    public init(modifier: @escaping (HTTPRequest) -> HTTPRequest) {
        self.modifier = modifier
        super.init()
    }

    override public func load(request: HTTPRequest, completion: @escaping (HTTPResult) -> Void) {
        let modifiedRequest = modifier(request)
        super.load(request: modifiedRequest, completion: completion)
    }
}
