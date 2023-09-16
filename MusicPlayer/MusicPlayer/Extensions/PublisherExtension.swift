//
//  PublisherExtension.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 16/09/23.
//

import Foundation
import Combine

extension Publisher where Self.Failure == Never {
  func sink(receiveValue: @escaping ((Self.Output) async -> Void)) -> AnyCancellable {
    sink { value in
      Task {
        await receiveValue(value)
      }
    }
  }
}
