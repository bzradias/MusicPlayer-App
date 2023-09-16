//
//  SongsListViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation

class SongsListViewModel: ObservableObject {
    @Published var songsList: SongsList = SongsList.getInstance()
    @Published var isSearching: Bool = false
    
    internal let limitPages: Int = 20
    internal var currentPage: Int = 0
    
    public func fetchSongsList(showProgress: Bool = true) async { }
    
    public func loadMore(showProgress: Bool) async {
        await fetchSongsList(showProgress: showProgress)
    }
    
    @MainActor
    internal func clear() {
        songsList = SongsList.getEmptyInstance()
        currentPage = 0
    }
}
