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
        
        label2.text = "Device   O"
        namedLabel2.placeholder = "Insert Device Name"
        
    }
    
    @IBAction override func nextButtonPressed(sender: Any) {
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "GameWithDeviceViewController") as? GameWithDeviceViewController else {
            print("Couldn't find to GameWithDeviceViewController")
            return
        }
        
        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
    }
    
}
