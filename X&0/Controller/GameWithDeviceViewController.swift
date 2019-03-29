//
//  GameWithDeviceViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithDeviceViewController: GameViewControllerModel {
    
    var inProgressLabel = UILabel()
    
    @IBAction func backButtonPressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowToPlayViewController")
            return
        }
        
        destinationVC.modalTransitionStyle = .flipHorizontal
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inProgressGame()
        
//
//        displayTopView()
//        displayCenterView()
//        displayBottomView()

    }
    
    func inProgressGame() {
    
        inProgressLabel = UILabel(frame: CGRect(x: (bounds.size.width - 280) / 2,
                                                y: (bounds.size.height - 50) / 2,
                                                width: 280,
                                                height: 50))
        inProgressLabel.text = "Sorry!Game in progress!"
        inProgressLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(inProgressLabel)
        
        let backButton = UIButton(frame: CGRect(x: 10,
                                                y: 0.036 * bounds.size.height,
                                                width: 50,
                                                height: 50))
        
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.contentMode = .scaleAspectFill
        
        backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        
        view.addSubview(backButton)
    }
    
    

    
    
}
