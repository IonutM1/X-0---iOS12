//
//  PlayerVsPlayerViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 21/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import Foundation

class PlayerVsPlayerViewController: TypeOfPlayerViewModel {
    
    @IBAction override func nextButtonPressed(sender: Any) {
        
        guard let destinationVC = self.mainStoryboard.instantiateViewController(withIdentifier: "GameWithPlayerViewController") as? GameWithPlayerViewController else {
            print("Couldn't find to GameWithPlayerViewController")
            return
        }
        
        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
        
        //        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTextFieldButonFrame()
        
    }
    
    override func labelTextFieldButonFrame() {
        super .labelTextFieldButonFrame()
        label2.text = "Player2  O"
        
        namedLabel2.placeholder = "Please Insert Your Name"
    }
}
