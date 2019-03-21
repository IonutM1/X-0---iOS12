//
//  GameViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithPlayerViewController: GameViewModel {
    
    @IBOutlet var player1Label: UILabel!
    @IBOutlet var player2Label: UILabel!
    
    @IBOutlet var namePlayer1: UITextField!
    
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setNeedsStatusBarAppearanceUpdate()
     
        view.backgroundColor = UIColor.cyan
//        displayTopView()
        displayCenterView()
        displayBottomView()
        displayTopView()
        
    }
    
  


    
    
}
