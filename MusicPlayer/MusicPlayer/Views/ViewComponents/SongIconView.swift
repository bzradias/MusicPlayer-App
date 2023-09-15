//
//  SongIconView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

enum SongIconStyle  {
    case Small, Large
    
    var radius: CGFloat {
        switch self {
        case .Small:
            return 8
        case .Large:
            return 39
        }
    }
    
    var size: CGFloat {
        switch self {
        case .Small:
            return 24
        case .Large:
            return 116
        }
    }
}

struct SongIconView: View {
    public var iconStyle: SongIconStyle = .Small
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedCornerShape(radius: iconStyle.radius, corner: .allCorners)
                .fill(ColorPalette.songIconBackground)
            Image("SongIcon")
                .resizable()
                .frame(width: iconStyle.size, height: iconStyle.size)
        }
    }
}

struct SongIconView_Previews: PreviewProvider {
    static var previews: some View {
        SongIconView()
    }
}
