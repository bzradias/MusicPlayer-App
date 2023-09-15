//
//  SongDescriptionView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

enum SongDescriptionStyle  {
    case Small, Large
    
    var songFont: Font {
        switch self {
        case .Small:
            return Font.custom("SF Pro Display", size: 16)
        case .Large:
            return Font.custom("SF Pro Display", size: 24)
        }
    }
    
    var artistFont: Font {
        switch self {
        case .Small:
            return Font.custom("SF Pro Display", size: 12)
        case .Large:
            return Font.custom("SF Pro Display", size: 14)
        }
    }
}

struct SongDescriptionView: View {
    public var songDescriptionStyle: SongDescriptionStyle = .Small
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Something")
                .font(songDescriptionStyle.songFont)
                .foregroundColor(ColorPalette.primaryText)
            Text("Artist")
                .font(songDescriptionStyle.artistFont)
                .foregroundColor(ColorPalette.secondaryText)
        }
    }
}

struct SongDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SongDescriptionView()
    }
}
