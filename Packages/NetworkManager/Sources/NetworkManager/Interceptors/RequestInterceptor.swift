import Foundation

/// A protocol to inspect or mutate an outgoing `URLRequest` before it connects to the network.
/// Crucial for injecting Authorization headers, logging telemetry, or appending standard query parameters globally.
public protocol RequestInterceptor {
    
    /// Intercepts and potentially modifies the outgoing request.
    /// - Parameter request: The original `URLRequest` built by `RequestBuilder`.
    /// - Returns: The modified `URLRequest`.
    /// - Throws: An error if the interception completely fails (e.g. failing to read a token from Keychain securely).
    func intercept(_ request: URLRequest) async throws -> URLRequest
}
