//
//  File.swift
//  NetworkManager
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import Foundation

public typealias Parameters = [String: Any]

public enum HTTPTask {
    case plainRequest
    case requestParameters(urlParameters: Parameters)
    case requestBodyEncodable(Encodable, urlParameters: Parameters? = nil)
    case requestBodyParameters(bodyParameters: Parameters, urlParameters: Parameters? = nil)
}
