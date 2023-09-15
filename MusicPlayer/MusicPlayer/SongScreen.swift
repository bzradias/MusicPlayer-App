//
//  SongScreen.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 13/09/23.
//

import SwiftUI

struct SongScreen: View {
    private let screenTitle: String = "Songs"
    
    @StateObject private var playerViewModel: PlayerViewModel = PlayerViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(playerViewModel.songList.indices) { songIndex in
//                    Text("\(playerViewModel.songList[songIndex])")
//                        .foregroundColor(ColorPalette.primaryText)
                    SongCardView()
                }
                .listRowBackground(ColorPalette.appBackground)
                .listRowSeparator(.hidden, edges: .all)
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .searchable(text: $playerViewModel.searchTerm)
            .navigationTitle(screenTitle)
            .background(ColorPalette.appBackground.ignoresSafeArea())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SongScreen()
    }
}
