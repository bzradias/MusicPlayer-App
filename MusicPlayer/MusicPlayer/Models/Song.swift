//
//  Song.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation

// MARK: - Song
struct Song: Codable, Identifiable, Hashable, InstanceProvider {
    let wrapperType, kind: String
    let artistID, collectionID: Int
    let id: Int
    let artistName, collectionName, trackName, collectionCensoredName: String
    let trackCensoredName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double
    let releaseDate, collectionExplicitness, trackExplicitness: String
    let discCount, discNumber, trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country, currency, primaryGenreName: String
    let isStreamable: Bool
    let contentAdvisoryRating: String?

    private enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case id = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable, contentAdvisoryRating
    }
    
    static func getInstance() -> Song {
        return Song(wrapperType: "track", kind: "song", artistID: 462006, collectionID: 192688369, id: UUID().hashValue, artistName: "Bob Dylan", collectionName: "Bob Dylan's Greatest Hits", trackName: "Blowin' In the Wind", collectionCensoredName: "Bob Dylan's Greatest Hits", trackCensoredName: "Blowin' In the Wind", artistViewURL: "https://music.apple.com/us/artist/bob-dylan/462006?uo=4", collectionViewURL: "https://music.apple.com/us/album/blowin-in-the-wind/192688369?i=192688540&uo=4", trackViewURL: "https://music.apple.com/us/album/blowin-in-the-wind/192688369?i=192688540&uo=4", previewURL: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/7b/c5/0a/7bc50a12-dabe-350f-4af7-66024c845a56/mzaf_12340017311729421397.plus.aac.p.m4a", artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Features124/v4/dc/e7/e3/dce7e385-5b40-bcda-4d09-ae4faab692ed/dj.fvugskmg.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Features124/v4/dc/e7/e3/dce7e385-5b40-bcda-4d09-ae4faab692ed/dj.fvugskmg.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Features124/v4/dc/e7/e3/dce7e385-5b40-bcda-4d09-ae4faab692ed/dj.fvugskmg.jpg/100x100bb.jpg", collectionPrice: 9.99, trackPrice: 1.29, releaseDate: "1963-05-27T07:00:00Z", collectionExplicitness: "notExplicit", trackExplicitness: "notExplicit", discCount: 1, discNumber: 1, trackCount: 10, trackNumber: 2, trackTimeMillis: 167000, country: "USA", currency: "USD", primaryGenreName: "Rock", isStreamable: true, contentAdvisoryRating: nil)
    }
}
