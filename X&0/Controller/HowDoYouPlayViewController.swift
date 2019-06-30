//
//  HowYouPlayViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyButton

class HowYouPlayViewController: UIViewController {
    

    
    
    let colorForButton = #colorLiteral(red: 0.1798445582, green: 0.5291955471, blue: 0.7605121136, alpha: 1)
    let shadowColor = #colorLiteral(red: 0.1226756051, green: 0.368516624, blue: 0.5351373553, alpha: 1)
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
        
        dismiss(animated: true, completion: nil)
        
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
        
        let howYouPlay = UILabel(frame: CGRect(x: (bounds.size.width - 170) / 2,
                                               y: 0.036 * bounds.size.height,
                                               width: 170,
                                               height: 50))
        howYouPlay.text = "Choose the game"
        howYouPlay.textAlignment = .center
        howYouPlay.textColor = UIColor.black
        howYouPlay.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(howYouPlay)
        
        let playerVsPlayer = PressableButton(frame: CGRect(x: (bounds.size.width - 250) / 2,
                                                    y: (bounds.size.height - 165) / 2,
                                                    width: 250,
                                                    height: 65))
        playerVsPlayer.setTitle("Player vs Player", for: .normal)
        playerVsPlayer.setTitleColor(UIColor.black, for: .normal)
        playerVsPlayer.setTitleColor(UIColor.white, for: .highlighted)
        playerVsPlayer.setTitleShadowColor(UIColor.black, for: .normal)
        playerVsPlayer.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        playerVsPlayer.colors = .init(button: colorForButton, shadow: shadowColor)
        playerVsPlayer.shadowHeight = 5
        playerVsPlayer.cornerRadius = 6
        
        playerVsPlayer.addTarget(self, action: #selector(buttonPressedWithPlayer(sender:)), for: .touchUpInside)
        
        view.addSubview(playerVsPlayer)
        
        let playerVsDevice = PressableButton(frame: CGRect(x: (bounds.size.width - 250) / 2,
                                                    y: (bounds.size.height + 100) / 2,
                                                    width: 250,
                                                    height: 65))
        playerVsDevice.setTitle("Player vs Device", for: .normal)
        playerVsDevice.setTitleColor(UIColor.black, for: .normal)
        playerVsDevice.setTitleColor(UIColor.white, for: .highlighted)
        playerVsDevice.setTitleShadowColor(UIColor.black, for: .normal)
        playerVsDevice.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        playerVsDevice.colors = .init(button: colorForButton, shadow: shadowColor)
        playerVsDevice.shadowHeight = 5
        playerVsDevice.cornerRadius = 6
        
        playerVsDevice.addTarget(self, action: #selector(buttonPressedWithDevice(sender:)), for: .touchUpInside)
        view.addSubview(playerVsDevice)
        
        
        
    }
  
}
