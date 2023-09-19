//
//  PlayerSheetView.swift
//  MusicPlayer
//
//  Created by Rafael Nunes Bezerra Dias on 15/09/23.
//

import SwiftUI

struct SheetViewSizes {
    static public var smallest: PresentationDetent = .height(187)
    static public var largest: PresentationDetent = .large
}

struct PlayerSheetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject public var playerViewModel: PlayerViewModel
    
    private let openAlbumLabel: String = "Open album"
    @Binding var selectedDetent: PresentationDetent
    
    @State private var presentationBlur: CGFloat = 7
    
    var body: some View {
        GeometryReader { geometry in
            if selectedDetent == SheetViewSizes.largest {
                modalView
            } else {
                bottomSheetView
            }
        }
        .animation(.linear, value: selectedDetent)
        .blur(radius: presentationBlur)
        .onChange(of: selectedDetent, perform: { newValue in
            if newValue == SheetViewSizes.smallest {
                dismiss.callAsFunction()
            }
            
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
                SongDescriptionView(song: playerViewModel.currentSong, songDescriptionStyle: .Medium)
                HStack(alignment: .center, spacing: 16) {
                    Button {
                        selectedDetent = SheetViewSizes.largest
                    } label: {
                        Image("ic-playlist")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text(openAlbumLabel)
                            .font(Fonts.mediumLargeBody)
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
                Text(playerViewModel.currentSong.collectionName ?? "-")
                    .font(Fonts.boldLargeBody)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorPalette.primaryText)
                    .frame(width: 390, height: 50, alignment: .center)
                SongsListView(viewModel: playerViewModel)
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

struct PlayerSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSheetView(playerViewModel: PlayerViewModel(currentSong: Song.getInstance()), selectedDetent: .constant(.medium))
    }
}
