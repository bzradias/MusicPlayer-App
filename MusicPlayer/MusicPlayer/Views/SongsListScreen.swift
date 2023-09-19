//
//  SongsListScreen.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 13/09/23.
//

import SwiftUI

struct SongsListScreen: View {
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    private let screenTitle: String = "Songs"
    
    var body: some View {
        NavigationView {
            SongsListView(viewModel: viewModel)
                .navigationTitle(screenTitle)
                .background(ColorPalette.appBackground.ignoresSafeArea())
                .searchable(text: $viewModel.searchTerm)
                .task {
                    viewModel.clear()
                    await viewModel.fetchSongsList(searchType: .SearchingTerm)
                }
        }
    }
}

struct SongsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        SongsListScreen()
    }
}
