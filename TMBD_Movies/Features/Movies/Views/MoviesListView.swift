//
//  MoviesListView.swift
//  TMBD_Movies
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import SwiftUI
import Data
import NetworkManager
import Domain

struct MoviesListView: View {
    @EnvironmentObject private var router: Router<MovieRoute>
    @StateObject private var viewModel = MoviesViewModel(
        moviesUseCase: MoviesUseCase(
            repository: MovieRepositoryImpl(
            apiClient: URLSessionClient(interceptors: [AuthTokenInterceptor()])
            )
        )
    )
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.movies) { movie in
                        MoviesCardView(movie: movie) {
                            if let id = movie.id {
                                router.navigate(to: .movieDetail(id: String(id)))
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Popular Movies")
            .task {
                await viewModel.fetchMovies()
            }
            .navigationDestination(for: MovieRoute.self) { route in
                switch route {
                case .movieDetail(let id):
                    Text("Details View for Movie ID: \(id)")
                        .navigationTitle("Details")
                }
            }
        }
    }
}

#Preview {
    MoviesListView()
}
