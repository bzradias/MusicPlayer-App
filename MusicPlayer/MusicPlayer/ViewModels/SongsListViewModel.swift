//
//  SongsListViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation
import Combine

enum SearchType {
    case None
    case LoadingMore
    case SearchingTerm
}

class SongsListViewModel: ObservableObject {
    @Published public var songsList: SongsList = SongsList.getEmptyInstance()
    @Published var isSearching: Bool = false
    @Published var isLoadingMore: Bool = false
    
    internal var subscriptions = Set<AnyCancellable>()
    
    internal let limitPages: Int = 20
    internal var currentPage: Int = 1
    
    public func fetchSongsList(searchType: SearchType) async { }
    
    @MainActor
    public func loadMore() async {
        LogHandler.shared.info("Loading more...")
        await fetchSongsList(searchType: .LoadingMore)
    }
    
    @MainActor
    internal func clear() {
        songsList = SongsList.getEmptyInstance()
        currentPage = 0
    }
    
    @MainActor
    public func insertNewSongs(newSongs: SongsList) {
        newSongs.results.forEach { [weak self] song in
            guard let `self` = self else { return }
            
            guard let songName: String = song.trackName, !songName.isEmpty else { return }
            
            if !self.songsList.results.contains(song) {
                self.songsList.results.append(song)
                LogHandler.shared.info("InsertNewSongs -> CurrentPage: \(self.currentPage) | SongCount: \(self.songsList.results.count) | SongName: \(songName)")
            }
        }
    }
}
