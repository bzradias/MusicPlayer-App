//
//  SongsListView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

struct SongsListView: View {
    @StateObject public var viewModel: SongsListViewModel
    private let noResultsLabel: String = "No results."
    private let loadingMoreLabel: String = "Loading more.."
    
    var body: some View {
        ZStack(alignment: .center) {
            if viewModel.isSearching {
                ZStack(alignment: .center) {
                    ColorPalette.appBackground.ignoresSafeArea(.all)
                    CustomProgressView()
                }
            } else if viewModel.songsList.results.isEmpty {
                ZStack(alignment: .center) {
                    Text(noResultsLabel)
                        .font(Fonts.regularLargeBody)
                        .foregroundColor(ColorPalette.secondaryText)
                }
            } else {
                List {
                    ForEach(viewModel.songsList.results) { song in
                        ZStack(alignment: .leading) {
                            SongCardView(song: song)
                                .onAppear {
                                    if viewModel.songsList.results.last == song {
                                        Task(priority: .high) {
                                            await viewModel.loadMore()
                                        }
                                    }
                                }
                            NavigationLink(destination: PlayerScreen(playerViewModel: PlayerViewModel(currentSong: song))) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                    }
                    .listRowBackground(ColorPalette.appBackground)
                    .listRowSeparator(.hidden, edges: .all)
                    .listRowInsets( .init(top: 8, leading: 16, bottom: 8, trailing: 0))
                    
                    ZStack(alignment: .center) {
                        ColorPalette.appBackground.ignoresSafeArea(.all)
                        if viewModel.isLoadingMore {
                            HStack(alignment: .center, spacing: 16) {
                                Text(loadingMoreLabel)
                                    .foregroundColor(ColorPalette.secondaryText)
                                CustomProgressView()
                            }
                        }
                    }
                    .listRowBackground(ColorPalette.appBackground)
                    .listRowSeparator(.hidden, edges: .all)
                }
                .refreshable {
                    await viewModel.fetchSongsList(searchType: .None)
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
            }
        }
    }
}

struct SongsListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView(viewModel: SongsListViewModel())
    }
}
