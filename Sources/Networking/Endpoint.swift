//
//  Endpoint.swift
//  Pokedex
//
//  Created by Mike Baldwin on 2/6/24.
//

import Foundation

struct Endpoint {
    var scheme: String
    var host: String
    var path: String
    var method: HTTPMethod
    var queryItems: [URLQueryItem]?
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
    
    init(
        scheme: String = "https",
        host: String = "pokeapi.co",
        path: String,
        method: HTTPMethod = .get,
        queryItems: [URLQueryItem]? = nil
    ) {
        self.scheme = scheme
        self.host = host
        self.path = "/api/v2/\(path)"
        self.method = method
        self.queryItems = queryItems
    }
}
