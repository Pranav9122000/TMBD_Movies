//
//  File.swift
//  NetworkManager
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import Foundation

public struct RequestBuilder {
    
    public static func build(from endPoint: Endpoint) throws -> URLRequest {
        
        // Use appendingPathComponent instead of `appending(component:)` 
        // because `appending(component:)` URL-encodes the `/` character to `%2F`!
        let fullURL = endPoint.baseURL.appendingPathComponent(endPoint.path)
        guard var urlComponents = URLComponents(url: fullURL, resolvingAgainstBaseURL: false) else {
            throw NetworkError.invalidURL
        }
        
        switch endPoint.task {
        case .requestParameters(let urlParameters),
                .requestBodyEncodable(_, let urlParameters?),
                .requestBodyParameters(_, let urlParameters?):
            
            urlComponents.queryItems = urlParameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
         
        default:
            break
        }
        
        guard let finalURL = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(
            url: finalURL,
            cachePolicy: endPoint.cachePolicy,
            timeoutInterval: 30.0
        )
        urlRequest.httpMethod = endPoint.method.rawValue
        
        if let headers = endPoint.headers {
            for(key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let isContentTypeMissing = urlRequest.value(forHTTPHeaderField: "Content-Type") == nil
        
        switch endPoint.task {
        case .plainRequest, .requestParameters:
            break

        case .requestBodyEncodable(let encodable, _):
            do {
                urlRequest.httpBody = try JSONEncoder().encode(encodable)
                if isContentTypeMissing {
                    urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
                }
            } catch {
                throw NetworkError.invalidRequest
            }
            
        case .requestBodyParameters(let bodyParameters, _):
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParameters, options: [])
                if isContentTypeMissing {
                    urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
                }
            } catch {
                throw NetworkError.invalidRequest
            }
        }
        
        return urlRequest
    }
}
