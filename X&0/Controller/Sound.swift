//
//  Sound.swift
//  X&0
//
//  Created by Ionut Marinica on 29/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import AVFoundation

class Sound: AVAudioPlayer {

    
    private var player: AVAudioPlayer?
    let path = Bundle.main.path(forResource: "SoundMP3", ofType: "mp3")
    
    func soundOn() {
        
        player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!), fileTypeHint: "mp3")
        
        player?.play()
        player?.numberOfLoops = -1
        
    }
    
    func soundOff() {
        
        player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!), fileTypeHint: "mp3")
        
        player?.stop()
    }
  
}
