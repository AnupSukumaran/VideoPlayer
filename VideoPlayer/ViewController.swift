//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Sukumar Anup Sukumaran on 10/10/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    let videoPlayer = AVPlayerViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        playerItem.addObserver(self, forKeyPath: "playbackBufferEmpty", options: .New, context: nil)
//        playerItem.addObserver(self, forKeyPath: "playbackLikelyToKeepUp", options: .New, context: nil)
//        playerItem.addObserver(self, forKeyPath: "playbackBufferFull", options: .New, context: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification){
        print("dataEnded")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playVideo(_ sender: Any) {
        //"http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"
        let video = AVPlayer(url: URL(string: "https://www.electronicvillage.org/evquizapp/upload/questions/13.mp3")!)
//
        videoPlayer.player = video
       // videoPlayer.showsPlaybackControls = false

        present(videoPlayer, animated: true) {
        print("Playing...")
           
            
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnTopViewController") as! OnTopViewController
            self.videoPlayer.addChild(popOverVC)
            self.videoPlayer.view.addSubview(popOverVC.view)
            popOverVC.view.center = CGPoint(x: self.videoPlayer.view.bounds.midX, y: self.videoPlayer.view.bounds.midY)
            popOverVC.didMove(toParent: self.videoPlayer)
            
//            let imageView = UIImageView(frame: CGRect(x: popOverVC.view.bounds.midX
//                , y: popOverVC.view.bounds.midY, width: 50 , height: 50))
//            imageView.image = UIImage(named: "speaker")
//            imageView.contentMode = .scaleAspectFit
//            popOverVC.view.addSubview(imageView)
        video.play()
        video.accessibilityElementsHidden = true

        }
        
//        let videoURL = URL(string: "https://www.electronicvillage.org/evquizapp/upload/questions/12.mp4")
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()
//
    }
    
}
