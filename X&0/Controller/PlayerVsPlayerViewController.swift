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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! GameWithPlayerViewController
//        vc.finalName = self.name
//    }
    
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
