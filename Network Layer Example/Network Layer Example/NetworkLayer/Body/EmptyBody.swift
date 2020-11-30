//
//  EmptyBody.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 30/11/2020.
//

import Foundation

public struct EmptyBody: HTTPBody {
    public let isEmpty = true

    public init() { }
    public func encode() throws -> Data { Data() }
}
