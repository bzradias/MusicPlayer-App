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
    @State private var showSongDetails: Bool = false
    @State private var selectedDetent: PresentationDetent = .fraction(0.22)
    private let availableDetents: Set<PresentationDetent> = [.fraction(0.22), .large]
    
    @State private var iconStyle: SongIconStyle = .Large
    private var iconViewSize: CGFloat {
        return iconStyle == .Large ? 200 : 44
    }
    
    @StateObject public var playerViewModel: PlayerViewModel
    
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
                    SongIconView(song: playerViewModel.currentSong, iconStyle: iconStyle)
                        .frame(width: iconViewSize, height: iconViewSize)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            PlayerControllView(song: playerViewModel.currentSong)
                .ignoresSafeArea(.all)
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            setupOrientation()
        }
        .task {
            await playerViewModel.fetchSongsList()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            setupOrientation()
        }
        .sheet(isPresented: $showSongDetails) {
            PlayerSheetView(playerViewModel: playerViewModel, selectedDetent: $selectedDetent)
                .presentationDetents(availableDetents, selection: $selectedDetent)
                .presentationDragIndicator(.hidden)
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
                showSongDetails.toggle()
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
        PlayerScreen(playerViewModel: PlayerViewModel(currentSong: Song.getInstance()))
    }
}
