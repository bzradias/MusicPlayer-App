//
//  GenericButton.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import SwiftUI

struct GenericButton<ViewContent: View>: View {
    var action: () -> ()
    var content: ViewContent
    
    var body: some View {
        Button {
            action()
        } label: {
            content
        }

    }
}

struct GenericButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericButton(action: {}, content: Image("SongIcon"))
    }
}
