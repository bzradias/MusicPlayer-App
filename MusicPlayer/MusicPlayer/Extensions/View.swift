//
//  View.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation
import SwiftUI

extension View {
    public func cornerRadius(radius: CGFloat, corner: UIRectCorner) -> some View {
            clipShape(RoundedCornerShape(radius: radius, corner: corner))
    }
}
