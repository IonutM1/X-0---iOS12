//
//  GameViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithPlayerViewController: GameViewControllerModel {

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTopView()
        displayCenterView()
        displayBottomView()
        
        print(label1.text!)
        print(label2.text!)
    }
    
}
