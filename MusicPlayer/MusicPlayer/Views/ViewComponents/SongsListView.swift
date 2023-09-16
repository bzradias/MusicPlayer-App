//
//  SongsListView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

struct SongsListView: View {
    @StateObject public var viewModel: SongsListViewModel
    
    var body: some View {
        if viewModel.isSearching {
            CustomProgressView()
        } else {
            List {
                ForEach(viewModel.songsList.results) { song in
                    ZStack(alignment: .leading) {
                        SongCardView(song: song)
                        NavigationLink(destination: PlayerScreen(playerViewModel: PlayerViewModel(currentSong: song))) {
                            EmptyView()
                        }
                        .opacity(0)
                    }
                }
                .listRowBackground(ColorPalette.appBackground)
                .listRowSeparator(.hidden, edges: .all)
                .listRowInsets( .init(top: 8, leading: 16, bottom: 8, trailing: 0))
            }
            .refreshable {
                await viewModel.fetchSongsList(showProgress: true)
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
        }
    }
}

struct SongsListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView(viewModel: SongsListViewModel())
    }
}
