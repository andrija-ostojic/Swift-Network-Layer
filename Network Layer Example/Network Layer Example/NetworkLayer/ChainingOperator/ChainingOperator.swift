//
//  ChainingOperator.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 01/12/2020.
//

import Foundation

precedencegroup LoaderChainingPrecedence {
    higherThan: NilCoalescingPrecedence
    associativity: right
}

infix operator --> : LoaderChainingPrecedence

@discardableResult
public func --> (lhs: HTTPLoader?, rhs: HTTPLoader?) -> HTTPLoader? {
    lhs?.nextLoader = rhs
    return lhs ?? rhs
}
