//
//  ServiceError.swift
//  Pokedex
//
//  Created by Mike Baldwin on 2/6/24.
//

import Foundation

public enum ServiceError: LocalizedError {
    case noResult
    case jsonDecodingFailed
    case dataDownloadFailed
    case accessDenied
    case unknownError
    case invalidStatusCode(Int)
    case badResponse
    
    public var errorDescription: String? {
        switch self {
        case .noResult: return "No Result"
        case .jsonDecodingFailed: return "JSON decoding failed"
        case .dataDownloadFailed: return "Failed to download data"
        case .accessDenied: return "Access denied"
        case .unknownError: return "Unknown error"
        case .invalidStatusCode(let code): return "Invalid status code: \(code)"
        case .badResponse: return "Bad response"
        }
    }
}
