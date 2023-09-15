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
            SongIconView(iconStyle: .Small)
                .frame(width: 44, height: 44)
            SongDescriptionView()
        }
    }
}

struct SongCardView_Previews: PreviewProvider {
    static var previews: some View {
        SongCardView(song: Song.getInstance())
    }
}
