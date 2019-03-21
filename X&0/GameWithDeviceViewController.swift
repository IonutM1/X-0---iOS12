//
//  GameWithDeviceViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithDeviceViewController: GameWithPlayerViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayTopView()
        displayCenterView()
        displayBottomView()
        
    }
    
    override func displayBottomView() {
        super.displayBottomView()
        player2Label.text = "Device - O"
    }
}
