//
//  AVPlayerSongItem.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 18/09/23.
//

import Foundation
import AVKit

class AVPlayerSongItem: AVPlayerItem {
    let song: Song
    
    init(song: Song, url: URL) {
        self.song = song
        super.init(asset: AVAsset(url: url), automaticallyLoadedAssetKeys: nil)
    }
}
