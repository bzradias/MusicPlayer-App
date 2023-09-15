//
//  SongScreen.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 13/09/23.
//

import SwiftUI

struct SongScreen: View {
    @StateObject private var playerViewModel: PlayerViewModel = PlayerViewModel()
    
    private let screenTitle: String = "Songs"
    
    var body: some View {
        NavigationView {
            SongsListView(songs: playerViewModel.songsList)
                .navigationTitle(screenTitle)
                .background(ColorPalette.appBackground.ignoresSafeArea())
                .searchable(text: $playerViewModel.searchTerm)
        }
    }
}

struct SongScreen_Previews: PreviewProvider {
    static var previews: some View {
        SongScreen()
    }
}
