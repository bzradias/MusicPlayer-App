//
//  Fonts.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 17/09/23.
//

import Foundation
import SwiftUI

struct Fonts {
    private enum FontWeightName: String {
        /// Weight: 400
        case regular = "SFPRODISPLAYREGULAR"
        /// Weight: 500
        case medium = "SFPRODISPLAYMEDIUM"
        /// Weight: 700
        case bold = "SFPRODISPLAYBOLD"
    }
    
    private enum FontSize: CGFloat {
        /// size: 8
        case SmallLabel = 8
        /// size: 10
        case MediumLabel = 10
        /// size: 12
        case LargeLabel = 12
        
        /// size: 14
        case SmallBody = 14
        /// size: 16
        case LargeBody = 16
        
        /// size: 18
        case SmallTitle = 18
        /// size: 24
        case LargeTitle = 24
        /// size: 32
        case XLargeTitle = 32
        
        /// size: 40
        case SmallDisplay = 40
        /// size: 48
        case LargeDisplay = 48
    }
    
    
    static var regularLargeBody: Font {
        return Font.custom(FontWeightName.regular.rawValue, size: FontSize.LargeBody.rawValue)
    }
    
    static var regularLargeLabel: Font {
        return Font.custom(FontWeightName.regular.rawValue, size: FontSize.LargeLabel.rawValue)
    }
    
    static var regularLargeTitle: Font {
        return Font.custom(FontWeightName.regular.rawValue, size: FontSize.LargeTitle.rawValue)
    }
    
    static var regularSmallBody: Font {
        return Font.custom(FontWeightName.regular.rawValue, size: FontSize.SmallBody.rawValue)
    }
    
    static var mediumSmallBody: Font {
        return Font.custom(FontWeightName.medium.rawValue, size: FontSize.SmallBody.rawValue)
    }
    
    static var boldSmallTitle: Font {
        return Font.custom(FontWeightName.bold.rawValue, size: FontSize.SmallTitle.rawValue)
    }

    static var mediumLargeBody: Font {
        return Font.custom(FontWeightName.medium.rawValue, size: FontSize.LargeBody.rawValue)
    }
    
    static var boldLargeBody: Font {
        return Font.system(size: 16).bold()
    }
}
