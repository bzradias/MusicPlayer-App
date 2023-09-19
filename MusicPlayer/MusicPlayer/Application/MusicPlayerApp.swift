//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 13/09/23.
//

import SwiftUI

@main
struct MusicPlayerApp: App {
    @State var isSplashLoading: Bool = true
    
    init() {
        Theme.navigationBarColors(background: ColorPalette.appBackground.toUIColor(), titleColor: ColorPalette.primaryText.toUIColor())
    }
    
    var body: some Scene {
        WindowGroup {
            if isSplashLoading {
                SplashScreen(isActive: $isSplashLoading)
                    .background(ColorPalette.appBackground.ignoresSafeArea(.all))
            } else {
                ZStack {
                    SongsListScreen()
                        .preferredColorScheme(ColorScheme.dark)
                }
                .animation(.easeOut, value: isSplashLoading)
            }
        }
    }
}
