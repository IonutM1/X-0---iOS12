//
//  PlayerVsPlayerViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 21/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import Foundation
import UIKit

class PlayerVsPlayerViewController: TypeOfPlayerViewModel {
    
    //MARK: - override startButtonPressed
    @IBAction override func startButtonPressed(sender: Any) {
        
        guard let destinationVC = self.mainStoryboard.instantiateViewController(withIdentifier: "GameWithPlayerViewController") as? GameWithPlayerViewController else {
            print("Couldn't find to GameWithPlayerViewController")
            return
        }

        destinationVC.finalName1 = "\(name1) - X"
        destinationVC.finalName2 = "\(name2) - O"
        
        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
        
        //        navigationController?.pushViewController(destinationVC, animated: true)
        
//        performSegue(withIdentifier: "GameWithPlayer", sender: self)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTextFieldButonFrame()
        
    }
    
    // MARK: - override labelTextFieldButtonFrame
    override func labelTextFieldButonFrame() {
        super .labelTextFieldButonFrame()
        label2.text = "Player2  O"
        
        namedLabel2.placeholder = "Please Insert Your Name"
        
    }
}
