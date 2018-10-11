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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playVideo(_ sender: Any) {
        let video = AVPlayer(url: URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!)
        let videoPlayer = AVPlayerViewController()
        videoPlayer.player = video
        videoPlayer.showsPlaybackControls = false
        present(videoPlayer, animated: true) {
            video.play()
            
        }
        
    }
    
}

