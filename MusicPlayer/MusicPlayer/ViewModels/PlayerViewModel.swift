//
//  PlayerViewModel.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation
import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var songList: [String] = ["Music 1", "Music 2", "Music 3", "Music 4", "Music 5", "Music 6", "Music 7", "Music 8", "Music 9", "Music 10", "Music 11", "Music 12", "Music 13", "Music 14", "Music 15"]
    @Published var searchTerm: String = ""
}
