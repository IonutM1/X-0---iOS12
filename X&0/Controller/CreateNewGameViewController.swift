//
//  ViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 15/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class CreateNewGameViewController: UIViewController, UIApplicationDelegate {
    
    let player = Sound()
    
    var sound = UIButton()
    
    var soundON = true
    var soundWhenLaunchApp = true
    var soundOnWhenComeBack = true
    
    override var prefersStatusBarHidden: Bool { return true }
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    let bounds = UIScreen.main.bounds
 
    // Sound On/Off
    @IBAction func soundButtonPressed(sender: Any) {
        print(soundON)
        
        if soundON == true {
            
            player.soundOff()
            print("SoundOff")
            sound.setImage(UIImage(named: "SoundOffIcon"), for: .normal)
            soundON = false
//            soundWhenLaunchApp = false
            
            
        }else if soundON == false {
            
            player.soundOn()
            print("SoundOn")
            sound.setImage(UIImage(named: "SoundIcon"), for: .normal)

    
            soundON = true
            
        }
    }
    
    @IBAction func newGameButtonPressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else{
            print("Couldn't find HowYouPlayViewController")
            return
        }
        
//        dismiss(animated: true, completion: nil)


        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // call this func to force preferredStatusBarStyle to be read again.
        setNeedsStatusBarAppearanceUpdate()
        if soundWhenLaunchApp == true && soundOnWhenComeBack == true{
            player.soundOn()
            soundWhenLaunchApp = false
            soundON = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.white
        newGame()
       
        
    }
    
    func newGame() {
        
        let newGameButton = UIButton(frame: CGRect(x: (bounds.size.width - 250) / 2,
                                                   y: 0.6 * bounds.size.height,
                                                   width: 250,
                                                   height: 50))
        
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)

        newGameButton.setTitleColor(#colorLiteral(red: 1, green: 0.3019607843, blue: 0.3019607843, alpha: 1), for: .normal)
        newGameButton.setTitleColor(UIColor.black, for: .highlighted)
        newGameButton.addTarget(self, action: #selector(newGameButtonPressed(sender:)), for: .touchUpInside)
        view.addSubview(newGameButton)
        
        sound = UIButton(frame: CGRect(x: bounds.size.width - 60,
                                       y: 0.036 * bounds.size.height,
                                       width: 50,
                                       height: 50))
        
        //        sound.setImage(UIImage(named: "SoundIcon"), for: .normal)
        sound.setImage(UIImage(named: "SoundIcon"), for: .normal)
        sound.contentMode = .scaleAspectFill
        
        sound.addTarget(self, action: #selector(soundButtonPressed(sender:)), for: .touchUpInside)
        view.addSubview(sound)
    }
    
    
}

