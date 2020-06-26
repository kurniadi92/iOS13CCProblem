//
//  EmbedAVPlayerViewController.swift
//  iOS13CCProblem
//
//  Created by Kurniadi on 26/06/20.
//  Copyright © 2020 Kurniadi. All rights reserved.
//

import UIKit
import AVKit

class EmbedAVPlayerViewController: UIViewController {

    private var currentPlayer: AVPlayer!
    private var playerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let videoURL = URL(string: "https://wowzaec2demo.streamlock.net/vod-multitrack/_definst_/smil:ElephantsDream/elephantsdream2.smil/playlist.m3u8")
        currentPlayer = AVPlayer(url: videoURL!)
        playerLayer = AVPlayerLayer(player: currentPlayer)
        playerLayer.frame = self.view.bounds
        
        self.view.layer.addSublayer(playerLayer)
        currentPlayer.play()
        currentPlayer.seek(to: CMTimeMake(value: 15, timescale: 1))
        
        setupNotification()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeNotification()
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appilcationDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil)
    }
    
    private func removeNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func applicationWillEnterForeground() {
        playerLayer.player = currentPlayer
    }
    
    @objc func appilcationDidEnterBackground() {
        playerLayer.player = nil
    }
    
    @IBAction func onDismissTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
