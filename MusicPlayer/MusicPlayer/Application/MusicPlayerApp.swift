//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 13/09/23.
//

import SwiftUI

@main
struct MusicPlayerApp: App {
    init() {
        Theme.navigationBarColors(background: ColorPalette.appBackground.toUIColor(), titleColor: ColorPalette.primaryText.toUIColor())
    }
    
    var body: some Scene {
        WindowGroup {
            SongScreen()
                .preferredColorScheme(ColorScheme.dark)
        }
    }
}
