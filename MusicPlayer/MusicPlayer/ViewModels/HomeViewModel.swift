//
//  HomeViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation
import SwiftUI

class HomeViewModel: SongsListViewModel {
    @Published var searchTerm: String = ""
    private var placeholderTerm: String = "Bob Dylan"
    
    private let iTunesAPI: iTunesInterfaceAPI = iTunesInterfaceAPI()
    
    override init() {
        super.init()
        
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                await self?.clear()
                await self?.fetchSongsList(term: term)
            }
            .store(in: &subscriptions)
    }
    
    public func refresh() async {
        await self.fetchSongsList(term: searchTerm, showProgress: false)
    }
    
    override public func fetchSongsList(showProgress: Bool = true) async {
        await fetchSongsList(term: searchTerm, showProgress: showProgress)
    }
    
    @MainActor
    public func fetchSongsList(term: String, showProgress: Bool = true) async {
        let searchTerm: String = term.isEmpty ? placeholderTerm : term
        
        if showProgress {
            isSearching = true
        }
        
        // Fetch songs
        if let songsList: SongsList = await iTunesAPI.sendRequest(type: .SongsListSearch(term: searchTerm, limit: limitPages, offset: currentPage)) {
            currentPage += 1
            insertNewSongs(newSongs: songsList)
        }
        
        if showProgress {
            isSearching = false
        }
        
        self.placeholderTerm = searchTerm
    }
}
