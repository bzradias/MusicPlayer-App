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
    
    internal func getRequestURL() -> URLRequest? {
        var request: URLRequest
        let timeout: TimeInterval = 10.0
        
        switch self {
        case .SongsListSearch(let term, let limit, let offset):
            guard let searchURL: URL = NSURL(string: "https://itunes.apple.com/search?term=\(getPreparedTerm(searchTerm: term))&entity=song&limit=\(limit)&offset=\(offset)&country=br&country=us") as? URL else {
                LogHandler.shared.error("API searchURL nil)")
                return nil
            }
            request = URLRequest(url: searchURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        case .AlbumSearch(let collectionID):
            guard let searchURL: URL = NSURL(string: "https://itunes.apple.com/lookup?id=\(collectionID)&entity=song") as? URL else {
                LogHandler.shared.error("API searchURL nil)")
                return nil
            }
            request = URLRequest(url: searchURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        }
        return request
    }
    
    private func getPreparedTerm(searchTerm: String) -> String {
        let resultTerm: String = searchTerm.replacing(" ", with: "+").folding(options: .diacriticInsensitive, locale: .current)
        return resultTerm
    }
}

class iTunesInterfaceAPI {
    private let headers = [
        "accept": "application/json",
    ]
    
    public func sendRequest<DecodableObject: Codable>(type: iTunesRequestType) async -> DecodableObject? {
        guard var request: URLRequest = type.getRequestURL() else {
            LogHandler.shared.error("Send request error)")
            return nil
        }
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return await APIManager.sendRequest(request: request)
    }
}
