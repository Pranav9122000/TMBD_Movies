//
//  File.swift
//  NetworkManager
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import Foundation

public protocol APIClient {
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T
}
