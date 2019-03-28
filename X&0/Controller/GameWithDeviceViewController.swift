//
//  GameWithDeviceViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithDeviceViewController: GameViewControllerModel {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        
        displayTopView()
        displayCenterView()
        displayBottomView()
        
    }
    
    override func displayBottomView() {
        super.displayBottomView()
        
        label1.text = finalName1
        print(label1.text!)
        
        label2.text = finalName2
        print(label2.text!)
        
    }
    
    
}
