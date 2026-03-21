//
//  File.swift
//  NetworkManager
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidRequest
    case invalidResponse
    case unauthorized
    case serverError(statusCode: Int, data: Data?)
    case noData
    case transportError(Error)
    case decodingFailed(Error)
    case unknown
    case offline
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided URL is not valid."
        case .invalidRequest:
            return "Failed to create a valid URL request."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .unauthorized:
            return "You are not authorized to access this resource."
        case .serverError(let statusCode, let data):
            return "Server returned an error with status code:  \(statusCode)."
        case .noData:
            return "No data was returned from the server."
        case .transportError(let error):
            return "Failed to communicate with the server: \(error.localizedDescription)."
        case .decodingFailed(let error):
            return "Failed to decode the server response: \(error.localizedDescription)."
        case .unknown:
            return "An unknown error occurred."
        case .offline:
            return "No internet connection."
        }
    }
}
