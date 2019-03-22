//
//  GameViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithPlayerViewController: GameViewModel {
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor.cyan

        displayCenterView()
        displayBottomView()
        displayTopView()
        
    }
    
}
