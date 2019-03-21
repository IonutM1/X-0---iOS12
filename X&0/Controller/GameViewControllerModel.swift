//
//  GameViewControllerModel.swift
//  X&0
//
//  Created by Ionut Marinica on 21/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import Foundation
import UIKit

class GameViewModel: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    @IBOutlet var namedLabel1: UITextField!
    @IBOutlet var namedLabel2: UITextField!
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    let bounds = UIScreen.main.bounds
    
    @IBAction func buttonNewGamePressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowYouPlayViewController")
            return
        }

        destinationVC.modalTransitionStyle = .coverVertical
        present(destinationVC, animated: true, completion: nil)
//        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func buttonResetGame(sender: Any) {
      
        viewDidLoad()
    }
    
    func displayTopView(){
        
        let containerView = UIView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
        containerView.backgroundColor = UIColor.gray
        view.addSubview(containerView)
        
        let newGame = UIButton(frame: CGRect(x: 10,
                                             y: 0.036 * bounds.size.height,
                                             width: 100,
                                             height: 34))
        
        newGame.setTitle("New game", for: .normal)
        newGame.setTitleColor(UIColor.black, for: .normal)
        newGame.setTitleColor(UIColor.white, for: .highlighted)
        
        newGame.layer.borderWidth = 1
        newGame.layer.borderColor = UIColor.black.cgColor
        newGame.layer.cornerRadius = 17
        
        newGame.addTarget(self, action: #selector(buttonNewGamePressed(sender:)), for: .touchUpInside)
        containerView.addSubview(newGame)
        
        let resetGame = UIButton(frame: CGRect(x: containerView.frame.size.width - 110,
                                               y: 0.036 * bounds.size.height,
                                               width: 100,
                                               height: 34))
        
        resetGame.setTitle("Reset", for: .normal)
        resetGame.setTitleColor(UIColor.black, for: .normal)
        resetGame.setTitleColor(UIColor.white, for: .highlighted)
        
        resetGame.layer.borderWidth = 1
        resetGame.layer.borderColor = UIColor.black.cgColor
        resetGame.layer.cornerRadius = 17
        
        resetGame.addTarget(self, action: #selector(buttonResetGame(sender:)), for: .touchUpInside)
        containerView.addSubview(resetGame)
        
        label1 = UILabel(frame: CGRect(x: (containerView.frame.size.width - 250) / 2,
                                                 y: (containerView.frame.size.height - newGame.frame.origin.y + 34) / 2,
                                                 width: 250,
                                                 height: 40))
        
        label1.font = UIFont.systemFont(ofSize: 20)
        label1.textColor = UIColor.black
        label1.backgroundColor = UIColor.white
        
        containerView.addSubview(label1)
    }
    
    func displayCenterView() {
        
        let containerView = UIView(frame: CGRect(x: 0,
                                                 y: 0.20 * bounds.size.height,
                                                 width: bounds.size.width,
                                                 height: 0.8 * bounds.size.height))
        
        
        containerView.backgroundColor = UIColor.white
        
        view.addSubview(containerView)
        
        
    }
    
    func displayBottomView() {
        
        let containerView = UIView(frame: CGRect(x: 0,
                                                 y: 0.8 * bounds.size.height,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
        containerView.backgroundColor = UIColor.green
        view.addSubview(containerView)
        
        label2 = UILabel(frame: CGRect(x: (containerView.frame.size.width - 250) / 2,
                                             y: (containerView.frame.size.height - 40) / 2,
                                             width: 250,
                                             height: 40))
        
        label2.font = UIFont.systemFont(ofSize: 20)
        label2.backgroundColor = UIColor.white
        label2.textAlignment = .center
        
        containerView.addSubview(label2)
        
    }
}
