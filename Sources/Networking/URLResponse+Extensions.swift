//
//  URLResponse+Extensions.swift
//  Pokedex
//
//  Created by Mike Baldwin on 2/6/24.
//

import Foundation

public extension URLResponse {
    @discardableResult
    func validate(statusCode: ClosedRange<Int> = 200...299) throws -> URLResponse {
        guard let httpResponse = self as? HTTPURLResponse else {
            throw ServiceError.badResponse
        }
        
        if statusCode.contains(httpResponse.statusCode) {
            return self
        } else {
            throw ServiceError.invalidStatusCode(httpResponse.statusCode)
        }
    }
}
