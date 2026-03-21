//
//  File.swift
//  Domain
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import Foundation

public struct MoviesUseCase {
    private let repository: MovieProtocol
    
    public init(repository: MovieProtocol) {
        self.repository = repository
    }
    
    public func getMovies() async throws -> MovieListResponse {
        return try await repository.getMovies()
    }
    
    public func getMovieDetails(_ id: Int) async throws -> MovieDetailsEntity {
        return try await repository.getMovieDetails(id)
    }
}
