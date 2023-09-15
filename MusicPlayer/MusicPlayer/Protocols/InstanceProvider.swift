//
//  InstanceProvider.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import Foundation

protocol InstanceProvider {
    static func getInstance() -> Self
}
