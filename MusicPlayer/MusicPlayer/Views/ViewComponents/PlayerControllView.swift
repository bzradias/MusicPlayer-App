//
//  PlayerControllView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import SwiftUI

struct PlayerControllView: View {
    @State private var playerTime: Double = 0
    @State var song: Song
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                SongDescriptionView(song: song, songDescriptionStyle: .Large)
                Spacer()
            }
            VStack {
                Slider(value: $playerTime, in: -100...100)
                    .tint(ColorPalette.sliderHighlightBackground)
                HStack {
                    Text("0:00")
                        .foregroundColor(ColorPalette.primaryText)
                    Spacer()
                    Text("-3:20")
                        .foregroundColor(ColorPalette.primaryText)
                }
            }
            HStack(alignment: .center, spacing: 20) {
                GenericButton(action: {
                    // TODO: Implementar comportamento
                }, content: Image("ic-backward").resizable().frame(width: 32, height: 32))
                
                GenericButton(action: {
                    // TODO: Implementar comportamento
                }, content: ZStack(alignment: .center) {
                    Circle()
                        .fill(.white)
                    Image("ic-play")
                        .resizable()
                        .frame(width: 32, height: 32)
                })
                .frame(width: 64, height: 64)
                
                GenericButton(action: {
                    // TODO: Implementar comportamento
                }, content: Image("ic-forward").resizable().frame(width: 32, height: 32))
            }
        }
    }
}

struct PlayerControllView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControllView(song: Song.getInstance())
    }
}
