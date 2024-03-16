//
//  Endpoint.swift
//  Pokedex
//
//  Created by Mike Baldwin on 2/6/24.
//

import Foundation

public struct Endpoint {
    public var scheme: String
    public var host: String
    public var path: String
    public var method: HTTPMethod
    public var queryItems: [URLQueryItem]?
    public var request: URLRequest {
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
    
    public init(
        scheme: String = "https",
        host: String,
        path: String,
        method: HTTPMethod = .get,
        queryItems: [URLQueryItem]? = nil
    ) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.method = method
        self.queryItems = queryItems
    }
}
