//
//  SongsList.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation

/// MARK: - SongsList
struct SongsList: Codable, InstanceProvider {
    var resultCount: Int
    var results: [Song]
    
    static func getInstance() -> SongsList {
        let songs: [Song] = [Song.getInstance(), Song.getInstance(), Song.getInstance()]
        return SongsList(resultCount: songs.count, results: songs)
    }
    
    static func getEmptyInstance() -> SongsList {
        let songs: [Song] = []
        return SongsList(resultCount: songs.count, results: songs)
    }
}
