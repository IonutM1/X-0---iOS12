//
//  GameViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithPlayerViewController: GameViewControllerModel {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor.cyan

        displayCenterView()
        displayBottomView()
        displayTopView()
        
    }
    
    override func displayTopView() {
        super.displayTopView()
        
        label1.text = finalName1
        print(label1.text!)
        
        label2.text = finalName2
        print(label2.text!)
    }
}
