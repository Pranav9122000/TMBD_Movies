//
//  File.swift
//  NetworkManager
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var task: HTTPTask { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var retries: Int { get }
}

extension Endpoint {
    var cachePolicy: URLRequest.CachePolicy { .useProtocolCachePolicy }
    var retries: Int { 0 }
}
