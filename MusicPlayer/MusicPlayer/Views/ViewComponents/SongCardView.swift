//
//  SongCardView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

struct SongCardView: View {
    var song: Song
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            SongIconView(song: song, iconStyle: .Small)
                .frame(width: 44, height: 44)
            SongDescriptionView(song: song)
        }
    }
}

struct SongCardView_Previews: PreviewProvider {
    static var previews: some View {
        SongCardView(song: Song.getInstance())
    }
}
