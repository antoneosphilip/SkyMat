//
//  VideoBackground.swift
//  Wezoo
//
//  Created by Antoneos Philip on 23/06/2026.
//
import SwiftUI
import AVKit

struct VideoBackgroundView: UIViewRepresentable {

    let mode: String

    func makeUIView(context: Context) -> UIView {
        LoopingVideoView(mode: mode)
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

final class LoopingVideoView: UIView {

    private var playerLayer: AVPlayerLayer?

    init(mode: String) {
        super.init(frame: .zero)

        backgroundColor = .black

        let player = VideoManager.shared.player(for: mode)

        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill

        self.playerLayer = layer

        self.layer.addSublayer(layer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
}

import Foundation
import AVKit

final class VideoManager {

    static let shared = VideoManager()

    private init() {}

    private var players: [String: AVQueuePlayer] = [:]
    private var loopers: [String: AVPlayerLooper] = [:]

    func player(for mode: String) -> AVQueuePlayer {

        if let player = players[mode] {
            return player
        }

        guard let url = Bundle.main.url(
            forResource: mode,
            withExtension: "mp4"
        ) else {
            fatalError("Video not found: \(mode).mp4")
        }

        let item = AVPlayerItem(url: url)

        let player = AVQueuePlayer()

        let looper = AVPlayerLooper(
            player: player,
            templateItem: item
        )

        player.isMuted = true
        player.play()

        players[mode] = player
        loopers[mode] = looper

        return player
    }
}
