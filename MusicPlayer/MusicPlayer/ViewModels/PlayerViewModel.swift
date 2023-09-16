//
//  PlayerViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation

class PlayerViewModel: SongsListViewModel {
    @Published public var currentSong: Song
    
    override func fetchSongsList(showProgress: Bool) async {
        // TODO: Fetch album songs
    }
    
    init(currentSong: Song) {
        self.currentSong = currentSong
    }
}
