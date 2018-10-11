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
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification){
        print("dataEnded")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playVideo(_ sender: Any) {
        let video = AVPlayer(url: URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!)
        
        videoPlayer.player = video
        videoPlayer.showsPlaybackControls = false
        present(videoPlayer, animated: true) {
            video.play()
            
        }
        
    }
    
}
