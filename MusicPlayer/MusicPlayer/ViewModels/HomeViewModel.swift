//
//  HomeViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation
import SwiftUI
import Combine


class HomeViewModel: SongsListViewModel {
    @Published var searchTerm: String = ""
    private let placeholderTerm: String = "Bob Dylan"
    
    private let iTunesAPI: iTunesInterfaceAPI = iTunesInterfaceAPI()
    private var subscriptions = Set<AnyCancellable>()
    
    private let limitPages: Int = 20
    private var currentPage: Int = 0
    
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
    
    @MainActor
    private func clear() {
        songsList = SongsList.getEmptyInstance()
        currentPage = 0
    }
    
    override public func fetchSongsList(showProgress: Bool = true) async {
        await fetchSongsList(term: searchTerm)
    }
    
    @MainActor
    public func fetchSongsList(term: String, showProgress: Bool = true) async {
        let searchTerm: String = term.isEmpty ? placeholderTerm : term
        
        if showProgress {
            isSearching = true
        }
        
        // Fetch songs
        if let songsList: SongsList = await iTunesAPI.sendRequest(type: .SongsListSearch(term: searchTerm)) {
            self.songsList = songsList
        }
        
        if showProgress {
            isSearching = false
        }
    }
}
