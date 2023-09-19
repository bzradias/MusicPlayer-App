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
                .foregroundColor(songDescriptionStyle.artistFontColor)
        }
    }
}

enum SongDescriptionStyle  {
    case Small, Medium, Large
    
    var songFont: Font {
        switch self {
        case .Small: return Fonts.regularLargeBody
        case .Medium: return Fonts.boldSmallTitle
        case .Large: return Fonts.regularLargeTitle
        }
    }
    
    var artistFont: Font {
        switch self {
        case .Small: return Fonts.regularLargeLabel
        case .Medium: return Fonts.mediumSmallBody
        case .Large: return Fonts.regularSmallBody
        }
    }
    
    var artistFontColor: Color {
        switch self {
        case .Small, .Large: return ColorPalette.secondaryText
        case .Medium: return ColorPalette.subtitle
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
