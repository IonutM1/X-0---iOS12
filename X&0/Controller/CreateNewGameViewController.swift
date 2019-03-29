//
//  ViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 15/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class CreateNewGameViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // call this func to force preferredStatusBarStyle to be read again.
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.white
        
    }
    
    
}

