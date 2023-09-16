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
    
    public func fetchSongsList(showProgress: Bool = true) async { }
}
