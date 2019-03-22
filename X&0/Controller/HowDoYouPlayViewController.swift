//
//  HowDoYouPlayViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class HowDoYouPlayViewController: UIViewController {
    
    let bounds = UIScreen.main.bounds
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    override var prefersStatusBarHidden: Bool { return true }
    
    @IBAction func backButtonPressed (sender: Any) {
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "CreateNewGameViewController") as? CreateNewGameViewController else {
            print("Couldn't find to CreateNewGameViewController")
            return
        }
        
        present(destinationVC, animated: true, completion: nil)
    }
    
    @IBAction func buttonPressedWithPlayer (sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "PlayerVsPlayerViewController") as? PlayerVsPlayerViewController else {
            print("Couldn't find to PlayerVsPlayerViewController")
            return
        }
        
//        destinationVC.modalTransitionStyle = .partialCurl
        present(destinationVC, animated: true, completion: nil)
        
//        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func buttonPressedWithDevice (sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "PlayerVsDeviceViewController") as? PlayerVsDeviceViewController else {
            print("Couldn't find to PlayerVsDeviceViewController")
            return
        }
//        destinationVC.modalTransitionStyle = .partialCurl
        present(destinationVC, animated: true, completion: nil)
        
//        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // call this func to force preferredStatusBarStyle to be read again.
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        view.backgroundColor = UIColor.cyan
        buttons()
        
    }
    
    func buttons() {

        let backButton = UIButton(frame: CGRect(x: 10,
                                                y: 0.036 * bounds.size.height,
                                                width: 50,
                                                height: 50))
        
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        backButton.contentMode = .scaleAspectFill
        
        view.addSubview(backButton)
        
        let howYouPlay = UILabel(frame: CGRect(x: (bounds.size.width - 200) / 2,
                                               y: 0.04 * bounds.size.height,
                                               width: 200,
                                               height: 50))
        howYouPlay.text = "How you play?"
        howYouPlay.textAlignment = .center
        howYouPlay.textColor = UIColor.black
        howYouPlay.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(howYouPlay)
        
        let playerVsPlayer = UIButton(frame: CGRect(x: (bounds.size.width - 250) / 2,
                                                    y: 0.25 * bounds.size.height,
                                                    width: 250,
                                                    height: 40))
        playerVsPlayer.setTitle("Player vs Player", for: .normal)
        playerVsPlayer.setTitleColor(UIColor.black, for: .normal)
        playerVsPlayer.setTitleColor(UIColor.white, for: .highlighted)
        playerVsPlayer.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        playerVsPlayer.addTarget(self, action: #selector(buttonPressedWithPlayer(sender:)), for: .touchUpInside)
        
        view.addSubview(playerVsPlayer)
        
        let playerVsDevice = UIButton(frame: CGRect(x: (bounds.size.width - 250) / 2,
                                                    y: 0.65 * bounds.size.height,
                                                    width: 250,
                                                    height: 40))
        playerVsDevice.setTitle("Player vs Device", for: .normal)
        playerVsDevice.setTitleColor(UIColor.black, for: .normal)
        playerVsDevice.setTitleColor(UIColor.white, for: .highlighted)
        playerVsDevice.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        playerVsDevice.addTarget(self, action: #selector(buttonPressedWithDevice(sender:)), for: .touchUpInside)
        view.addSubview(playerVsDevice)
        
    }
  
}
