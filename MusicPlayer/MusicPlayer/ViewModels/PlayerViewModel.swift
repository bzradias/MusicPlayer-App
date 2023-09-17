//
//  PlayerViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation

class PlayerViewModel: SongsListViewModel {
    @Published public var currentSong: Song
    private let iTunesAPI: iTunesInterfaceAPI = iTunesInterfaceAPI()
    
    @MainActor
    override func fetchSongsList(showProgress: Bool = true) async {
        if showProgress {
            isSearching = true
        }
        
        // Fetch songs
        if let songsList: SongsList = await iTunesAPI.sendRequest(type: .AlbumSearch(collectionID: currentSong.collectionID)) {
            self.currentPage += 1
            insertNewSongs(newsSongs: songsList)
        }
        
        if showProgress {
            isSearching = false
        }
    }
    
    init(currentSong: Song) {
        self.currentSong = currentSong
    }
}
