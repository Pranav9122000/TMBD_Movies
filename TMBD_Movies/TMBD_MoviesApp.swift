//
//  TMBD_MoviesApp.swift
//  TMBD_Movies
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import SwiftUI

@main
struct TMBD_MoviesApp: App {
    // 1. Create the global source of truth for navigation
    @StateObject private var router = Router<MovieRoute>()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // 2. Inject it into the Environment for all child views to access!
                .environmentObject(router)
        }
    }
}
