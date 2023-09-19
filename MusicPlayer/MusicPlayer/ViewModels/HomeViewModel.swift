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
    private let placeholderTerm: String = "Bob Dylan"
    
    private let iTunesAPI: iTunesInterfaceAPI = iTunesInterfaceAPI()
    
    override init() {
        super.init()
        
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                await self?.clear()
                await self?.fetchSongsList(term: term, searchType: .SearchingTerm)
            }
            .store(in: &subscriptions)
    }
    
    public func refresh() async {
        await self.fetchSongsList(term: searchTerm, searchType: .None)
    }
    
    override public func fetchSongsList(searchType: SearchType) async {
        await fetchSongsList(term: searchTerm, searchType: searchType)
    }
    
    @MainActor
    public func fetchSongsList(term: String, searchType: SearchType) async {
        let searchTerm: String = term.isEmpty ? placeholderTerm : term
        
        switch searchType {
        case .SearchingTerm: isSearching = true
        case .LoadingMore: isLoadingMore = true
        case .None: break
        }
        
        // Fetch songs
        if let songsList: SongsList = await iTunesAPI.sendRequest(type: .SongsListSearch(term: searchTerm, limit: limitPages, page: currentPage)) {
            currentPage += 1
            insertNewSongs(newSongs: songsList)
        }
        
        switch searchType {
        case .SearchingTerm: isSearching = false
        case .LoadingMore: isLoadingMore = false
        case .None: break
        }
    }
}
