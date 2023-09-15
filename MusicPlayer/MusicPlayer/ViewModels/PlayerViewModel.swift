//
//  PlayerViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation
import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var songsList: SongsList = SongsList.getInstance()
    @Published var searchTerm: String = ""
}
