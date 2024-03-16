//
//  SessionProvider.swift
//  Pokedex
//
//  Created by Mike Baldwin on 2/6/24.
//

import Foundation

public struct SessionProvider {
    public init() { }
    
    public func sendRequest<T>(
        _ request: URLRequest,
        for decodable: T.Type
    ) async throws -> T where T: Decodable {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadRevalidatingCacheData
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var response: (data: Data, urlResponse: URLResponse)
        
        response = try await session.data(for: request)
        
        try response.urlResponse.validate()
        
        let decodedData = try JSONDecoder().decode(decodable, from: response.data)
        
        return decodedData
    }
    
    private func error(for urlResponse: URLResponse) -> ServiceError {
        guard let httpResponse = urlResponse as? HTTPURLResponse
        else {
            return ServiceError.unknownError
        }
        
        switch httpResponse.statusCode {
        case 403:
            return ServiceError.accessDenied
        default:
            return ServiceError.unknownError
        }
    }
}
