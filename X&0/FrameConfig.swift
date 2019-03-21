//
//  FrameConfig.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class FrameConfig: UIViewController {
    
    var uiLabel = UILabel()
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        uiLabel.text = ""
        uiLabel.textColor = UIColor.blue
        uiLabel.backgroundColor = UIColor.white
    }
    
}
