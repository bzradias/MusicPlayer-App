//
//  iTunesInterfaceAPI.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation

public enum iTunesRequestType {
    case SongsListSearch(term: String, limit: Int, offset: Int)
    case AlbumSearch(collectionID: Int)
    
    internal func getRequestURL() -> URLRequest {
        var request: URLRequest
        let timeout: TimeInterval = 10.0
        
        switch self {
        case .SongsListSearch(let term, let limit, let offset):
            request = URLRequest(url: NSURL(string: "https://itunes.apple.com/search?term=\(term.replacing(" ", with: "+"))&entity=song&limit=\(limit)&offset=\(offset)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        case .AlbumSearch(let collectionID):
            request = URLRequest(url: NSURL(string: "https://itunes.apple.com/lookup?id=\(collectionID)&entity=song")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        }
        return request
    }
}

class iTunesInterfaceAPI {
    private let headers = [
        "accept": "application/json",
    ]
    
    public func sendRequest<DecodableObject: Codable>(type: iTunesRequestType) async -> DecodableObject? {
        var request: URLRequest = type.getRequestURL()
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return await APIManager.sendRequest(request: request)
    }
}
