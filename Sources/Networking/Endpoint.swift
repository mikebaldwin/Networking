//
//  Endpoint.swift
//  Pokedex
//
//  Created by Mike Baldwin on 2/6/24.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get set }
    var host: String { get set }
    var path: String { get set }
    var method: HTTPMethod { get set }
    var queryItems: [URLQueryItem]? { get set }
    var request: URLRequest { get }
}

public extension Endpoint {
    var request: URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            fatalError("Failed to construct a valid url from components.")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
