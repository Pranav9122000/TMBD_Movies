//
//  File.swift
//  Domain
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import Foundation

public protocol MovieProtocol {
    func getMovies() async throws -> MovieListResponse
    func getMovieDetails(_ id: Int) async throws -> MovieDetailsEntity
}
