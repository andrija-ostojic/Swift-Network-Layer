//
//  HTTPStatt.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 30/11/2020.
//

import Foundation

public struct HTTPStatus: Hashable {
    public static let ok = HTTPStatus(rawValue: 200)
    public static let created = HTTPStatus(rawValue: 201)
    public static let movedPermanently = HTTPStatus(rawValue: 301)
    public static let badRequest = HTTPStatus(rawValue: 400)
    public static let unauthorized = HTTPStatus(rawValue: 401)
    public static let forbidden = HTTPStatus(rawValue: 403)
    public static let notFound = HTTPStatus(rawValue: 404)
    public static let internalServerError = HTTPStatus(rawValue: 500)

    public let rawValue: Int
}
