//
//  File 2.swift
//  NetworkManager
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import Foundation

public final class URLSessionClient: APIClient {
    
    private let session: URLSession
    private let interceptors: [RequestInterceptor]
    
    public init(session: URLSession = .shared, interceptors: [RequestInterceptor] = []) {
        self.session = session
        self.interceptors = interceptors
    }
    
    public func request<T>(_ endpoint: any Endpoint, responseType: T.Type) async throws -> T where T : Decodable {
        let request = try RequestBuilder.build(from: endpoint)
        let retries = endpoint.retries
        
        return try await executeWithRetry(
            request: request,
            retriesLeft: retries,
            responseType: responseType
        )
    }
    
    public func executeWithRetry<T: Decodable>(request: URLRequest, retriesLeft: Int, responseType: T.Type) async throws-> T {
        
        // --- 1. RUN INTERCEPTORS ---
        var finalRequest = request
        for interceptor in interceptors {
            finalRequest = try await interceptor.intercept(finalRequest)
        }
        
        do {
            let (data, response) = try await session.data(for: finalRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                guard !data.isEmpty else {
                    throw NetworkError.noData
                }
                do {
                    let decoder = JSONDecoder()
                    return try decoder.decode(T.self, from: data)
                }
            case 401:
                throw NetworkError.unauthorized
            default:
                throw NetworkError.serverError(statusCode: httpResponse.statusCode, data: data)
            }
        } catch {
            print("🚨 NETWORK ERROR: \(error.localizedDescription)")
            print("🚨 EXACT ERROR: \(error)")
            
            if retriesLeft > 0 {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                print("Network request failed. Retrying... (\(retriesLeft) attempts left)")
                
                return try await executeWithRetry(
                    request: finalRequest,
                    retriesLeft: retriesLeft - 1,
                    responseType: responseType
                )
            }
            
            let cache = session.configuration.urlCache ?? URLCache.shared
            
            if let cachedResponse = cache.cachedResponse(for: finalRequest) {
                print("Network request failed and was served from cache.")
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: cachedResponse.data)
                    return decoded
                } catch {
                    throw NetworkError.decodingFailed(error)
                }
            }
            
            if let networkError = error as? NetworkError {
                throw networkError
            }
            throw NetworkError.transportError(error)
        }
    }
}
