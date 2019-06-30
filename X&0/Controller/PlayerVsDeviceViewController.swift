//
//  PlayerVsDeviceViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class PlayerVsDeviceViewController: PlayerVsPlayerViewController {
    
    //MARK: - override startButtonPressed
    @IBAction override func startButtonPressed(sender: Any) {
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "GameWithDeviceViewController") as? GameWithDeviceViewController else {
            print("Couldn't find to GameWithDeviceViewController")
            return
        }
        destinationVC.finalName1 = "\(name1)    X"
        destinationVC.finalName2 = "\(name2)    O"
        
        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        
        labelTextFieldButonFrame()
        
    }
    
    //MARK: - override labelTextFieldButonFrame
    override func labelTextFieldButonFrame() {
        super.labelTextFieldButonFrame()
        
        label2.text = "Device   O"
        namedLabel2.placeholder = "Insert Device Name"
        name2 = "Device"
    }   
}
