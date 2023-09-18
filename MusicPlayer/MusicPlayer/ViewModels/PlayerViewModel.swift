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
    
    private let iTunesAPI: iTunesInterfaceAPI = iTunesInterfaceAPI()
    
    public var audioPlayer: AVPlayer = AVPlayer()
    private var playerItems = [AVPlayerSongItem]()
    private var currentTrack = 0
    
    public var currentAudioPlayer : AVPlayerItem? {
        return audioPlayer.currentItem
    }
    public var isPlaying: Bool {
        return audioPlayer.isPlaying
    }
    
    init(currentSong: Song) {
        self.currentSong = currentSong
        super.init()
        
        self.firstSetupPlayer(currentSong: currentSong)
        
        Task {
            // Get all album's songs
            await fetchSongsList(showProgress: false)
            
            // Setup songs queue
            setupSongsQueue(songsListQueue: songsList.results)
        }
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
    
    // MARK: Setup Player
    private func firstSetupPlayer(currentSong: Song) {
        if let playerSongItem: AVPlayerSongItem = buildSongItem(song: currentSong) {
            audioPlayer.replaceCurrentItem(with: playerSongItem)
        }
        
        audioPlayer.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.01, preferredTimescale: 1000), queue: nil) { [weak self] time in
            guard let item = self?.currentAudioPlayer else {
              return
            }
            self?.playerTime = time.seconds / item.duration.seconds
          }
    }
    
    private func buildSongItem(song: Song) -> AVPlayerSongItem? {
        guard let songURL: URL = song.getAudioURL() else {
            return nil
        }
        return AVPlayerSongItem(song: song, url: songURL)
    }
    
    private func addNewQueueSong(song: Song) -> Int? {
        guard let playerSongItem: AVPlayerSongItem = buildSongItem(song: song) else {
            return nil
        }

        playerItems.append(playerSongItem)
        
        let insertedPosition: Int = playerItems.count - 1
        return insertedPosition
    }
    
    private func setupSongsQueue(songsListQueue: [Song]) {
        songsListQueue.forEach { song in
            // Remove duplicates
            guard canAddNewSongIntoQueue(song: song) else {
                return
            }
            
            let insertedIndex: Int? = addNewQueueSong(song: song)
            LogHandler.shared.info("SetupSongsQueue > Inserted song: \(song.trackName ?? "-") | index: \(insertedIndex ?? -1)")
            if song == currentSong, let insertedIndex {
                // Set the queue index of the current playing song
                currentTrack = insertedIndex
            }
        }
    }
    
    private func canAddNewSongIntoQueue(song: Song) -> Bool {
        return playerItems.contains(where: { playerItem in playerItem.song == song }) ? false : true
    }
    
    // MARK: - Player Basic Controls
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
    
    // MARK: - Player Queue Control
    func previousTrack() {
        if currentTrack - 1 < 0 {
            currentTrack = (playerItems.count - 1) < 0 ? 0 : (playerItems.count - 1)
        } else {
            currentTrack -= 1
        }

        playTrack(index: currentTrack)
    }

    func nextTrack() {
        if currentTrack + 1 < playerItems.count {
            currentTrack += 1
        } else {
            currentTrack = 0
        }

        playTrack(index: currentTrack)
    }

    func playTrack(index: Int) {
        guard (0..<playerItems.count).contains(index) else { return }
        
        // Reset song player audio
        audioPlayer.pause()
        audioPlayer.currentItem?.seek(to: .zero, completionHandler: nil)
        
        // Switching to the new song
        let newSongItem: AVPlayerSongItem = playerItems[index]
        audioPlayer.replaceCurrentItem(with: newSongItem)
        self.currentSong = newSongItem.song
        startPlayer()
    }
}
