//
//  SongsListViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation
import Combine

class SongsListViewModel: ObservableObject {
    @Published public var songsList: SongsList = SongsList.getEmptyInstance()
    @Published var isSearching: Bool = false
    
    internal var subscriptions = Set<AnyCancellable>()
    
    internal let limitPages: Int = 20
    internal var currentPage: Int = 0
    
    public func fetchSongsList(showProgress: Bool = true) async { }
    
    @MainActor
    public func loadMore(showProgress: Bool) async {
        await fetchSongsList(showProgress: showProgress)
    }
    
    @MainActor
    internal func clear() {
        songsList = SongsList.getEmptyInstance()
        currentPage = 0
    }
    
    @MainActor
    public func insertNewSongs(newSongs: SongsList) {
        newSongs.results.forEach { song in
            guard let songName: String = song.trackName, !songName.isEmpty else { return }
            
            if !self.songsList.results.contains(song) {
                self.songsList.results.append(song)
            }
        }
    }
}
