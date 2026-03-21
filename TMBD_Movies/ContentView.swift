//
//  ContentView.swift
//  TMBD_Movies
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router<MovieRoute>
    
    var body: some View {
        MoviesListView()
            .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
