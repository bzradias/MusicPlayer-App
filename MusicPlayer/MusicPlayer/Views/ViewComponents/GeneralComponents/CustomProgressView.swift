//
//  CustomProgressView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        ProgressView()
            .tint(ColorPalette.sliderHighlightBackground)
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView()
    }
}
