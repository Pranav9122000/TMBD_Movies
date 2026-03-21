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
        
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOWRiZjc2YjQ3MGRkYjEwYTExMTA0ODAwMzdhN2U2ZCIsIm5iZiI6MTcwODE4ODQwNy42NzM5OTk4LCJzdWIiOiI2NWQwZTJmNzY5YzcwZjAxNGE5ODFkZDIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.HXm1Xb3Cm3rZxfywYQyJj1NSzGhG5uRl-2szfjoQiZg"
        
        modifiedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return modifiedRequest
    }
}
