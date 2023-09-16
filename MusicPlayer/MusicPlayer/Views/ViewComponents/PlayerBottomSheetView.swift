//
//  PlayerBottomSheetView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import SwiftUI

struct PlayerBottomSheetView: View {
    public var song: Song
    
    private let openAlbumLabel: String = "Open album"
    private let albumTitle: String = "Album Name"
    @Binding var selectedDetent: PresentationDetent
    
    @State private var presentationBlur: CGFloat = 7
    
    var body: some View {
        GeometryReader { geometry in
            if selectedDetent == .large {
                modalView
            } else {
                bottomSheetView
            }
        }
        .animation(.linear, value: selectedDetent)
        .blur(radius: presentationBlur)
        .onChange(of: selectedDetent, perform: { newValue in
            triggerBlurEffect()
        })
        .onAppear {
            triggerBlurEffect()
        }
    }
    
    @ViewBuilder
    private var bottomSheetView: some View {
        ZStack(alignment: .top) {
            ColorPalette.bottomSheetBackground.edgesIgnoringSafeArea(.all)
            capsuleView
            VStack(alignment: .center, spacing: 42) {
                SongDescriptionView(song: song, songDescriptionStyle: .Medium)
                HStack(alignment: .center, spacing: 16) {
                    Button {
                        selectedDetent = .large
                    } label: {
                        Image("ic-playlist")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text(openAlbumLabel)
                            .foregroundColor(ColorPalette.primaryText)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 30)
        }
    }
    
    private var modalView: some View {
        ZStack(alignment: .top) {
            ColorPalette.appBackground.edgesIgnoringSafeArea(.all)
            capsuleView
            VStack(alignment: .center, spacing: 0) {
                Text(albumTitle)
                    .font(Font.system(size: 16).bold())
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorPalette.primaryText)
                    .frame(width: 390, height: 50, alignment: .center)
                SongsListView(songs: SongsList.getInstance())
            }
            .padding(.top, 10)
        }
    }
    
    private var capsuleView: some View {
        Capsule()
            .fill(ColorPalette.sliderBackground)
            .frame(width: 36, height: 5)
            .padding(5)
    }
    
    private func triggerBlurEffect() {
        presentationBlur = 7
        withAnimation(.easeOut(duration: 0.5)) {
            self.presentationBlur = 0
        }
    }
}

struct PlayerBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBottomSheetView(song: Song.getInstance(), selectedDetent: .constant(.medium))
    }
}
