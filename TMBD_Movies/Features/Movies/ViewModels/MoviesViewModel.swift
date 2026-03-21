//
//  MoviesViewModel.swift
//  TMBD_Movies
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import Foundation
import Combine
import Domain
import Data

class MoviesViewModel: ObservableObject {
    @Published var movies: [MovieEntity] = []
    @Published var movieDetails: MovieDetailsEntity?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    private let moviesUseCase: MoviesUseCase
        
    init(moviesUseCase: MoviesUseCase) {
        self.moviesUseCase = moviesUseCase
    }
    
    func fetchMovies() async {
        isLoading = true
        errorMessage = ""
        
        do {
            let result = try await moviesUseCase.getMovies()
            self.movies = result.results
        } catch  {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func fetchMovieDetails(id: Int) async {
        isLoading = true
        errorMessage = ""
        
        do {
            let result = try await moviesUseCase.getMovieDetails(id)
            self.movieDetails = result
        } catch  {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
