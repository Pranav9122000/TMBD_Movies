import Foundation
import Domain
import NetworkManager

public final class MovieRepositoryImpl: MovieProtocol {
    
    private let apiClient: APIClient
    
    public init(apiClient: APIClient = URLSessionClient()) {
        self.apiClient = apiClient
    }
    
    public func getMovies() async throws -> MovieListResponse {
        let endPoint = MoviesRouter.allMovies
        return try await apiClient.request(endPoint, responseType: MovieListResponse.self)
    }
    
    public func getMovieDetails(_ id: Int) async throws -> MovieDetailsEntity {
        let endPoint = MoviesRouter.movieDetails(id: id)
        return try await apiClient.request(endPoint, responseType: MovieDetailsEntity.self)
    }
}
