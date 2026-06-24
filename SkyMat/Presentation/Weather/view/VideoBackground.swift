//
//  VideoBackground.swift
//  Wezoo
//
//  Created by Antoneos Philip on 23/06/2026.
//

import SwiftUI
import AVFoundation

struct VideoBackgroundView: UIViewRepresentable {
    var mode:String
    class Coordinator {
        var player: AVPlayer?
        var playerLayer: AVPlayerLayer?
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .black

        guard let path = Bundle.main.path(forResource:mode, ofType: "mp4") else {
            print("❌ Video not found in bundle")
            return view
        }

        let url = URL(fileURLWithPath: path)

        let item = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: item)

        player.isMuted = true
        player.actionAtItemEnd = .none

        context.coordinator.player = player

        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = view.bounds

        context.coordinator.playerLayer = playerLayer

        view.layer.addSublayer(playerLayer)

        player.play()

        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: item,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            context.coordinator.playerLayer?.frame = uiView.bounds
        }
    }
}
