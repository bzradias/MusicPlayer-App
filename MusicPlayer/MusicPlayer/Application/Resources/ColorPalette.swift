//
//  ColorPalette.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation
import SwiftUI

struct ColorPalette {
    // MARK: - Text
    static var primaryText: Color {
        return Color(hex: 0xFFFFFF)
    }

    static var secondaryText: Color {
        return Color(hex: 0x737373)
    }
    
    static var subtitle: Color {
        return Color(hex: 0xA8A8A8)
    }
    
    static var playerTimeText: Color {
        return Color(hex: 0xBFBFBF)
    }
    
    // MARK: - Background
    static var appBackground: Color {
        return Color(hex: 0x000000)
    }
    
    static var bottomSheetBackground: Color {
        return Color(hex: 0x262626).opacity(0.8)
    }
    
    static var songIconBackground: Color {
        return Color(hex: 0xFFFFFF).opacity(0.10)
    }

    static var sliderBackground: Color {
        return sliderHighlightBackground.opacity(0.25)
    }

    static var sliderHighlightBackground: Color {
        return Color(hex: 0xFFFFFF)
    }
}

