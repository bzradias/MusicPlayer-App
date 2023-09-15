//
//  PlayerScreen.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 14/09/23.
//

import SwiftUI

struct PlayerScreen: View {
    @Environment(\.presentationMode) var presentation
    @State private var orientation = UIDevice.current.orientation
    @State private var iconStyle: SongIconStyle = .Large
    
    var song: Song
    
    var body: some View {
        VStack(alignment: .center) {
            customNavBar
            GeometryReader { geometry in
                LazyHGrid(rows: [
                    GridItem(.fixed(geometry.size.height * 0.2), alignment: .center),
                    GridItem(.fixed(geometry.size.height * 0.4), alignment: .center),
                    GridItem(.fixed(geometry.size.height * 0.4), alignment: .center)
                ], alignment: .center, spacing: 0) {
                    Spacer()
                    SongIconView(iconStyle: iconStyle)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            PlayerControllView(song: song)
                .ignoresSafeArea(.all)
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            setupOrientation()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            setupOrientation()
        }
    }
    
    private var customNavBar: some View {
        HStack(alignment: .bottom, spacing: 0) {
            GenericButton(action: {
                self.presentation.wrappedValue.dismiss()
            }, content: Image("ic-arrow-left").resizable().frame(width: 24, height: 24))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)

            
            Spacer()
            GenericButton(action: {
                // TODO: Abrir Bottom Sheet
            }, content: Image("ic-more").resizable().frame(width: 24, height: 24))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
        }
    }
    
    private func setupOrientation() {
        guard UIDevice.current.orientation.isValidInterfaceOrientation else { return }
        
        iconStyle = UIDevice.current.orientation == .portrait ? .Large : .Small
    }
}

struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScreen(song: Song.getInstance())
    }
}
