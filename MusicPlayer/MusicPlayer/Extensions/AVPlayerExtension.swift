//
//  AVPlayerExtension.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 17/09/23.
//

import Foundation
import AVKit

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
