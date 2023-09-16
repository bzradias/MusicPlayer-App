//
//  SongIconView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI
import Kingfisher

struct SongIconView: View {
    public var song: Song
    public var iconStyle: SongIconStyle = .Small
    
    private var iconImageName: String {
        return iconStyle == .Small ? song.artworkUrl30 : song.artworkUrl100
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedCornerShape(radius: iconStyle.radius, corner: .allCorners)
                .fill(ColorPalette.songIconBackground)
            songImageView
                .frame(width: iconStyle.size, height: iconStyle.size)
                .padding(iconStyle.padding)
        }
        .fixedSize()
    }
    
    @ViewBuilder
    private var songImageView: some View {
        if !iconImageName.isEmpty {
            KFImage(URL(string: iconImageName))
                .resizable()
                .placeholder { progress in
                    ZStack {
                        RoundedCornerShape(radius: 8, corner: .allCorners)
                            .fill(ColorPalette.sliderBackground)
                        if !progress.isFinished {
                            ProgressView()
                                .tint(ColorPalette.sliderHighlightBackground)
                        }
                    }
                }
                .resizable()
        } else {
            Image("SongIcon")
                .resizable()
        }
    }
}

enum SongIconStyle  {
    case Small, Large
    
    var radius: CGFloat {
        switch self {
        case .Small: return 8
        case .Large: return 39
        }
    }
    
    var size: CGFloat {
        switch self {
        case .Small: return 24
        case .Large: return 116
        }
    }
    
    var padding: CGFloat {
        switch self {
        case .Small: return 10
        case .Large: return 41
        }
    }
}

struct SongIconView_Previews: PreviewProvider {
    static var previews: some View {
        SongIconView(song: Song.getInstance())
    }
}
