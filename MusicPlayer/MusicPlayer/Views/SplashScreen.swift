//
//  SplashScreen.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 17/09/23.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var isActive: Bool
    @State private var iconBlur: CGFloat = 7
    @State private var iconScaleSize: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            ColorPalette.appBackground.ignoresSafeArea()
            Image("ic-splashscreen")
                .frame(width: 200, height: 200, alignment: .center)
                .blur(radius: iconBlur)
                .scaleEffect(iconScaleSize)
        }
        .statusBarHidden(true)
        .onAppear {
            withAnimation(.easeOut(duration: 1.5)) {
                self.iconBlur = 0
                self.iconScaleSize = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 1)) {
                    isActive = false
                }
            }
        }
        .padding(.leading, 108)
        .padding(.trailing, 107.49812)
        .padding(.top, 322)
        .padding(.bottom, 374)
//        .frame(width: 414, height: 896, alignment: .top)
        .background(
          LinearGradient(
            stops: [
              Gradient.Stop(color: .black.opacity(0), location: 0.00),
              Gradient.Stop(color: .black.opacity(0), location: 0.49),
              Gradient.Stop(color: Color(red: 0.11, green: 0.19, blue: 0.28), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.07, y: 1.16),
            endPoint: UnitPoint(x: 0.93, y: -0.04)
          )
        )
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(isActive: .constant(false))
    }
}
