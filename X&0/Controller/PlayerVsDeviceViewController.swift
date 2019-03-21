//
//  PlayerVsDeviceViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class PlayerVsDeviceViewController: PlayerVsPlayerViewController {
    
    override func viewDidLoad() {
        labelTextFieldButonFrame()
      
    }
    
    override func labelTextFieldButonFrame() {
        super.labelTextFieldButonFrame()
        player2Label.text = "Device - O"
        namePlayer2.placeholder = "Insert Device Name"
        
    }
    
    @IBAction override func nextButtonPressed(sender: Any) {
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "GameWithDeviceViewController") as? GameWithDeviceViewController else {
            print("Couldn't find to GameWithDeviceViewController")
            return
        }
        
        present(destinationVC, animated: true, completion: nil)
    }
    
    override func okButton2Pressed(sender: Any) {
        
    }
    
    
    
}
//
//    @IBOutlet var namePlayer: UITextField!
//
//    @IBAction func nextButtonPressed(sender: UIButton) {
//
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "GameWithDeviceViewController") as? GameWithDeviceViewController else {
//            print("Couldn't find to GameWithDeviceViewController")
//            return
//        }
//
//
////        destinationVC.modalTransitionStyle = .flipHorizontal
//        present(destinationVC, animated: true, completion: nil)
//
//    }
//
//    var pl = PlayerVsPlayerViewController()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        display()
//    }
//
//
//    func display(){
//
//        let bounds = UIScreen.main.bounds
//
//        let containerView = UIView(frame: CGRect(x: 0,
//                           y: 0,
//                           width: bounds.size.width,
//                           height: bounds.size.height))
//
//        containerView.backgroundColor = UIColor.cyan
//        view.addSubview(containerView)
//
//        let playerLabel = UILabel(frame: CGRect(x: (containerView.frame.size.width - 160) / 2,
//                                                y: containerView.frame.size.height / 2,
//                                                width: 160,
//                                                height: 40))
//        playerLabel.text = "Player"
//        playerLabel.font = UIFont.boldSystemFont(ofSize: 30)
//        playerLabel.textAlignment = .center
//        playerLabel.textColor = UIColor.black
//
//        containerView.addSubview(playerLabel)
//
//        namePlayer = UITextField(frame: CGRect(x: (containerView.frame.size.width - 200) / 2,
//                            y: playerLabel.frame.origin.y + 40,
//                            width: 200, height: 40))
//
//        namePlayer.text = "Please insert your Name"
//        namePlayer.font = UIFont.systemFont(ofSize: 18)
//        namePlayer.textAlignment = .center
//        namePlayer.textColor = UIColor.black
//        namePlayer.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//
//        containerView.addSubview(namePlayer)
//
//        let nextButton = UIButton(frame: CGRect(x: containerView.frame.size.width - 110,
//                                                y: containerView.frame.size.height - 50,
//                                                width: 100,
//                                                height: 40))
//        nextButton.setTitle("Next", for: .normal)
//        nextButton.setTitleColor(UIColor.black, for: .normal)
//        nextButton.setTitleColor(UIColor.white, for: .highlighted)
//
//        nextButton.layer.borderColor = UIColor.black.cgColor
//        nextButton.layer.borderWidth = 1
//        nextButton.layer.cornerRadius = 20
//
//        nextButton.addTarget(self, action: #selector(nextButtonPressed(sender:)), for: .touchUpInside)
//        containerView.addSubview(nextButton)
//
//
//    }
//
//}
