//
//  APIManager.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation

class APIManager {
    static public func sendRequest<DecodableObject: Codable>(request: URLRequest) async -> DecodableObject? {
        let session = URLSession.shared
        
        defer {
            session.finishTasksAndInvalidate()
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                LogHandler.shared.error("API Request invalid HTTPURLResponse")
                return nil
            }
            
            guard httpResponse.statusCode == 200 else {
                LogHandler.shared.error("API Request invalid status code: \(httpResponse.statusCode)")
                return nil
            }

            let responseData: DecodableObject = try JSONDecoder().decode(DecodableObject.self, from: data)
            LogHandler.shared.notice("API Request successfully")
            return responseData
        } catch {
            LogHandler.shared.error("API Request error: \(error.localizedDescription)")
            return nil
        }
    }
}
