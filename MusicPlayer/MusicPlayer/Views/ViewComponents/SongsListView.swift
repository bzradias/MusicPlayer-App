//
//  SongsListView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

struct SongsListView: View {
    @State public var songs: SongsList
    
    var body: some View {
        List {
            ForEach(songs.results) { song in
                ZStack(alignment: .leading) {
                    SongCardView(song: song)
                    NavigationLink(destination: PlayerScreen(song: song)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
            }
            .listRowBackground(ColorPalette.appBackground)
            .listRowSeparator(.hidden, edges: .all)
            .listRowInsets( .init(top: 8, leading: 16, bottom: 8, trailing: 0))
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
    }
}

struct SongsListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView(songs: SongsList.getInstance())
    }
}
