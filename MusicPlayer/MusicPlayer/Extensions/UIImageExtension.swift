//
//  UIImageExtension.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 18/09/23.
//

import Foundation
import SwiftUI

extension UIImage {
    convenience init?(diameter: CGFloat, color: UIColor) {
        let size = CGSize(width: diameter, height: diameter)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let contex = UIGraphicsGetCurrentContext() else {
            return nil
        }

        contex.saveGState()
        let rect = CGRect(origin: .zero, size: size)
        contex.setFillColor(color.cgColor)
        contex.fillEllipse(in: rect)
        contex.restoreGState()

        guard let image = UIGraphicsGetImageFromCurrentImageContext(),
        let cgImage = image.cgImage else {
            return nil
        }
        UIGraphicsEndImageContext()

        self.init(cgImage: cgImage)
    }
}
