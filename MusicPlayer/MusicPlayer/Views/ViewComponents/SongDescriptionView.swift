//
//  SongDescriptionView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

struct SongDescriptionView: View {
    public var song: Song
    public var songDescriptionStyle: SongDescriptionStyle = .Small
    
    var body: some View {
        VStack(alignment: songDescriptionStyle.alignment, spacing: songDescriptionStyle.spacing) {
            Text(song.trackName ?? "-")
                .font(songDescriptionStyle.songFont)
                .foregroundColor(ColorPalette.primaryText)
            Text(song.artistName ?? "-")
                .font(songDescriptionStyle.artistFont)
                .foregroundColor(ColorPalette.secondaryText)
        }
    }
}

enum SongDescriptionStyle  {
    case Small, Medium, Large
    
    var songFont: Font {
        switch self {
        case .Small: return Font.custom("SF Pro Display", size: 16)
        case .Medium: return Font.custom("SF Pro Display", size: 18)
        case .Large: return Font.custom("SF Pro Display", size: 24)
        }
    }
    
    var artistFont: Font {
        switch self {
        case .Small: return Font.custom("SF Pro Display", size: 12)
        case .Medium, .Large: return Font.custom("SF Pro Display", size: 14)
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .Small, .Large: return 4
        case .Medium: return 14
        }
    }
    
    var alignment: HorizontalAlignment {
        switch self {
        case .Small, .Large: return .leading
        case .Medium: return .center
        }
    }
}

struct SongDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SongDescriptionView(song: Song.getInstance())
    }
}
