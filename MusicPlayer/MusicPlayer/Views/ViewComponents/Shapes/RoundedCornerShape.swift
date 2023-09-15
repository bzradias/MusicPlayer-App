//
//  RoundedCornerShape.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    var radius: CGFloat
    var corner: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path: UIBezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCornerShape_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerShape(radius: 16, corner: .bottomLeft)
            .frame(width: 300, height: 300)
            .fixedSize()
    }
}
