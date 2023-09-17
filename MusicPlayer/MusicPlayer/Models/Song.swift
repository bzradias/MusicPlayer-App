//
//  Song.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation

// MARK: - Song
struct Song: Codable, Identifiable, Hashable, InstanceProvider {
    let wrapperType: String?
    let collectionType: String?
    let artistID, collectionID: Int?
    let amgArtistID: Int?
    let artistName, collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let collectionPrice: Double?
    let collectionExplicitness: String?
    let trackCount: Int?
    let copyright: String?
    let country, currency, releaseDate, primaryGenreName: String?
    let kind: String?
    let id: Int?
    let trackName, trackCensoredName: String?
    let trackViewURL: String?
    let previewURL: String?
    let artworkUrl30: String?
    let trackPrice: Double?
    let trackExplicitness: String?
    let discCount, discNumber, trackNumber, trackTimeMillis: Int?
    let isStreamable: Bool?
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName, kind
        case id = "trackId"
        case trackName, trackCensoredName
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, trackPrice, trackExplicitness, discCount, discNumber, trackNumber, trackTimeMillis, isStreamable, contentAdvisoryRating
    }
    
    static func getInstance() -> Song {
        return Song(wrapperType: "track", collectionType: "song", artistID: 462006, collectionID: 192688369, amgArtistID: nil, artistName: "", collectionName: "Bob Dylan", collectionCensoredName: "Bob Dylan's Greatest Hits", artistViewURL: "Blowin' In the Wind", collectionViewURL: "Bob Dylan's Greatest Hits", artworkUrl60: "Blowin' In the Wind", artworkUrl100: "https://music.apple.com/us/artist/bob-dylan/462006?uo=4", collectionPrice: 0, collectionExplicitness: "https://music.apple.com/us/album/blowin-in-the-wind/192688369?i=192688540&uo=4", trackCount: 1, copyright: nil, country: "https://is1-ssl.mzstatic.com/image/thumb/Features124/v4/dc/e7/e3/dce7e385-5b40-bcda-4d09-ae4faab692ed/dj.fvugskmg.jpg/30x30bb.jpg", currency: "", releaseDate: "https://is1-ssl.mzstatic.com/image/thumb/Features124/v4/dc/e7/e3/dce7e385-5b40-bcda-4d09-ae4faab692ed/dj.fvugskmg.jpg/100x100bb.jpg", primaryGenreName: "", kind: "", id: UUID().hashValue, trackName: "notExplicit", trackCensoredName: "notExplicit", trackViewURL: "", previewURL: "", artworkUrl30: "", trackPrice: 2, trackExplicitness: nil, discCount: nil, discNumber: nil, trackNumber: 1, trackTimeMillis: nil, isStreamable: nil, contentAdvisoryRating: nil)
    }
}
