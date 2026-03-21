//
//  AuthTokenInterceptor.swift
//  TMBD_Movies
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import Foundation
import NetworkManager

class AuthTokenInterceptor: RequestInterceptor {
    
    func intercept(_ request: URLRequest) async throws -> URLRequest {
        var modifiedRequest = request
        
        let token = ""
        
        modifiedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return modifiedRequest
    }
}
