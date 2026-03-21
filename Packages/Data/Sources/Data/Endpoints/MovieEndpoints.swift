import Foundation
import NetworkManager // This gives you access to Endpoint, HTTPMethod, etc!

public enum MoviesRouter: Endpoint {
    case allMovies
    case movieDetails(id: Int)
    
    public var baseURL: URL {
        // Replace with your actual live base URL (example uses TMDB)
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    public var path: String {
        switch self {
        case .allMovies:
            return "/discover/movie"
        case .movieDetails(let id):
            return "/movie/\(id)"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .allMovies, .movieDetails:
            return .get
        }
    }
    
    public var headers: [String: String]? {
        return [
            "Content-Type"  : "application/json"
        ]
    }
    
    public var task: HTTPTask {
        switch self {
        case .allMovies, .movieDetails:
            return .plainRequest
        }
    }
    
    public var cachePolicy: URLRequest.CachePolicy {
        .useProtocolCachePolicy
    }

    public var retries: Int {
        3
    }
}
