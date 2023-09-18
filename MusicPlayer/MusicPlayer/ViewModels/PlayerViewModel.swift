//
//  PlayerViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import Foundation
import AVKit

class PlayerViewModel: SongsListViewModel {
    @Published public var currentSong: Song
    @Published public var playerTime: Double = 0
    public var audioPlayer: AVPlayer = AVPlayer()
    private let iTunesAPI: iTunesInterfaceAPI = iTunesInterfaceAPI()
    
    public var currentAudioPlayer : AVPlayerItem? {
        return audioPlayer.currentItem
    }
    
    public var isPlaying: Bool {
        return audioPlayer.isPlaying
    }
    
    init(currentSong: Song) {
        self.currentSong = currentSong
        super.init()
        
        self.setupPlayer()
    }
    
    @MainActor
    override func fetchSongsList(showProgress: Bool = true) async {
        guard let collectionID: Int = currentSong.collectionID else {
            LogHandler.shared.error("No collection ID found")
            return
        }
        
        if showProgress {
            isSearching = true
        }
        
        // Fetch album songs
        if let songsList: SongsList = await iTunesAPI.sendRequest(type: .AlbumSearch(collectionID: collectionID)) {
            self.currentPage += 1
            insertNewSongs(newSongs: songsList)
        }
        
        if showProgress {
            isSearching = false
        }
    }
    
    private func setupPlayer() {
        guard let currentSong: String = currentSong.previewURL, let songURL: URL = URL(string: currentSong) else {
            return
        }
        
        audioPlayer = AVPlayer(url: songURL)
        audioPlayer.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.01, preferredTimescale: 1000), queue: nil) { [weak self] time in
            guard let item = self?.currentAudioPlayer else {
              return
            }
            self?.playerTime = time.seconds / item.duration.seconds
          }
    }
    
    public func startPlayer() {
        audioPlayer.play()
    }
    
    public func pausePlayer() {
        audioPlayer.pause()
    }
    
    public func resumePlayer() {
        guard let item = currentAudioPlayer else {
        return
      }
        let targetTime: Double = playerTime * item.duration.seconds
        LogHandler.shared.info("duration: \(item.duration.seconds) | targetTime: \(targetTime)")
        audioPlayer.seek(to: CMTime(seconds: targetTime, preferredTimescale: 1000))
        startPlayer()
    }
}
