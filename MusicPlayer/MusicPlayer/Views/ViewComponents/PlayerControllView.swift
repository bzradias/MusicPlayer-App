//
//  PlayerControllView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import CoreMedia
import SwiftUI

struct PlayerControllView: View {
    @StateObject public var playerViewModel: PlayerViewModel
    
    private var remainingSongTimeLabel: String {
        guard let item = playerViewModel.currentAudioPlayer, !item.duration.seconds.isNaN else {
            return "0:00"
        }
        let remaining = item.duration - min(item.currentTime(), item.duration)
        let minutes = remaining.seconds / 60
        let seconds = remaining.seconds
        
        return "-\(String(format: "%.0f:%.0f", minutes, seconds))"
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                SongDescriptionView(song: playerViewModel.currentSong, songDescriptionStyle: .Large)
                Spacer()
            }
            VStack {
                Slider(value: $playerViewModel.playerTime, in: 0...1, onEditingChanged: { isEditing in
                    if isEditing {
                        playerViewModel.pausePlayer()
                    } else {
                        playerViewModel.resumePlayer()
                    }
                })
                .tint(ColorPalette.sliderHighlightBackground)
                HStack {
                    Text("0:00")
                        .foregroundColor(ColorPalette.primaryText)
                    Spacer()
                    Text(remainingSongTimeLabel)
                        .foregroundColor(ColorPalette.primaryText)
                }
            }
            HStack(alignment: .center, spacing: 20) {
                GenericButton(action: {
                    // TODO: Implementar comportamento
                }, content: Image("ic-backward").resizable().frame(width: 32, height: 32))
                
                GenericButton(action: {
                    if playerViewModel.isPlaying {
                        playerViewModel.pausePlayer()
                    } else {
                        playerViewModel.startPlayer()
                        playerViewModel.audioPlayer.actionAtItemEnd = .advance
                    }
                }, content: ZStack(alignment: .center) {
                    Circle()
                        .fill(.white)
                    Image(playerViewModel.isPlaying ? "ic-pause-filled": "ic-play")
                        .resizable()
                        .frame(width: 32, height: 32)
                })
                .frame(width: 64, height: 64)
                
                GenericButton(action: {
                    // TODO: Implementar comportamento
                }, content: Image("ic-forward").resizable().frame(width: 32, height: 32))
            }
        }
        .onAppear {
            playerViewModel.startPlayer()
        }
        .onDisappear {
            playerViewModel.pausePlayer()
        }
    }
}

struct PlayerControllView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControllView(playerViewModel: PlayerViewModel(currentSong: Song.getInstance()))
    }
}
