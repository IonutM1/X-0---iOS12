//
//  HowYouPlayViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit
import AVFoundation

class HowYouPlayViewController: UIViewController {
    
//    var player: AVAudioPlayer?
    let player = Sound()
    var sound = UIButton()
    var soundOff = UIButton()
    
    let bounds = UIScreen.main.bounds
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    override var prefersStatusBarHidden: Bool { return true }
    
    // MARK: - ButtonPressed
    // backButtonPressed
    @IBAction func backButtonPressed (sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "CreateNewGameViewController") as? CreateNewGameViewController else {
            print("Couldn't find to CreateNewGameViewController")
            return
        }
        
        destinationVC.modalTransitionStyle = .flipHorizontal
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    // buttonPressedWithPlayer
    @IBAction func buttonPressedWithPlayer (sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "PlayerVsPlayerViewController") as? PlayerVsPlayerViewController else {
            print("Couldn't find to PlayerVsPlayerViewController")
            return
        }
        

        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
        
//        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    // buttonPressedWithDevice
    @IBAction func buttonPressedWithDevice (sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "PlayerVsDeviceViewController") as? PlayerVsDeviceViewController else {
            print("Couldn't find to PlayerVsDeviceViewController")
            return
        }
        
        
        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
        
//        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    // Sound MP3
    @IBAction func soundButtonPressed(sender: Any) {
        
        player.soundOn()
        print("Sound On")
//        player.numberOfLoops = -1
        
        sound.isUserInteractionEnabled = false
    }
    // Sound OFF
    @IBAction func soundButtonOffPressed(sender: Any) {
    
        
        player.soundOff()
        print("Sound Off")
        
        sound.isUserInteractionEnabled = true
    }
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
  
        buttons()

    }
    
    // MARK: - set button
    func buttons() {

        let backButton = UIButton(frame: CGRect(x: 10,
                                                y: 0.036 * bounds.size.height,
                                                width: 50,
                                                height: 50))
        
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        backButton.contentMode = .scaleAspectFill
        
        view.addSubview(backButton)
        
        let howYouPlay = UILabel(frame: CGRect(x: (bounds.size.width - 140) / 2,
                                               y: 0.036 * bounds.size.height,
                                               width: 140,
                                               height: 50))
        howYouPlay.text = "How you play?"
        howYouPlay.textAlignment = .center
        howYouPlay.textColor = UIColor.black
        howYouPlay.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(howYouPlay)
        
        let playerVsPlayer = UIButton(frame: CGRect(x: (bounds.size.width - 250) / 2,
                                                    y: (bounds.size.height - 100) / 2,
                                                    width: 250,
                                                    height: 40))
        playerVsPlayer.setTitle("Player vs Player", for: .normal)
        playerVsPlayer.setTitleColor(UIColor.black, for: .normal)
        playerVsPlayer.setTitleColor(UIColor.red, for: .highlighted)
        playerVsPlayer.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        playerVsPlayer.layer.borderWidth = 1
        playerVsPlayer.layer.borderColor = UIColor.black.cgColor
        
        playerVsPlayer.addTarget(self, action: #selector(buttonPressedWithPlayer(sender:)), for: .touchUpInside)
        
        view.addSubview(playerVsPlayer)
        
        let playerVsDevice = UIButton(frame: CGRect(x: (bounds.size.width - 250) / 2,
                                                    y: (bounds.size.height + 100 ) / 2,
                                                    width: 250,
                                                    height: 40))
        playerVsDevice.setTitle("Player vs Device", for: .normal)
        playerVsDevice.setTitleColor(UIColor.black, for: .normal)
        playerVsDevice.setTitleColor(UIColor.red, for: .highlighted)
        playerVsDevice.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        playerVsDevice.layer.borderWidth = 1
        playerVsDevice.layer.borderColor = UIColor.black.cgColor
        playerVsDevice.addTarget(self, action: #selector(buttonPressedWithDevice(sender:)), for: .touchUpInside)
        view.addSubview(playerVsDevice)
        
        sound = UIButton(frame: CGRect(x: bounds.size.width - 90,
                                       y: 0.036 * bounds.size.height,
                                       width: 40,
                                       height: 50))
        
        sound.setImage(UIImage(named: "SoundIcon"), for: .normal)
        sound.contentMode = .scaleAspectFill
        
        sound.addTarget(self, action: #selector(soundButtonPressed(sender:)), for: .touchUpInside)
        view.addSubview(sound)
        
        soundOff = UIButton(frame: CGRect(x: bounds.size.width - 45,
                                          y: 0.036 * bounds.size.height,
                                          width: 40,
                                          height: 50))
        soundOff.setImage(UIImage(named: "SoundOffIcon"), for: .normal)
        soundOff.contentMode = .scaleAspectFill
        
        soundOff.addTarget(self, action: #selector(soundButtonOffPressed(sender:)), for: .touchUpInside)
        view.addSubview(soundOff)
        
    }
  
}
