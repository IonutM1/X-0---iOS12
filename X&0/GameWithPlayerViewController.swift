//
//  GameViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithPlayerViewController: UIViewController {
    
    let safeArea = UIEdgeInsets()
    
    let bounds = UIScreen.main.bounds
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    @IBOutlet var player1Label: UILabel!
    @IBOutlet var player2Label: UILabel!
    
    @IBOutlet var namePlayer1: UITextField!
    
    
    override var prefersStatusBarHidden: Bool { return true }
    
    @IBAction func buttonNewGamePressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowYouPlayViewController")
            return
        }
        
//        destinationVC.modalTransitionStyle = .partialCurl
        present(destinationVC, animated: true, completion: nil)
        
//                navigationController?.pushViewController(destinationVC, animated: true)

    }
    
    @IBAction func buttonResetGame(sender: Any) {
//        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "GameWithPlayerViewController") as? GameWithPlayerViewController else {
//            print("Couldn't fint to GameWithPlayerViewController")
//            return
//        }
//
//        present(destinationVC, animated: true, completion: nil)
        viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // call this func to force preferredStatusBarStyle to be read again.
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        view.backgroundColor = UIColor.cyan
        displayTopView()
        displayCenterView()
        displayBottomView()
        
    }
    
    func displayTopView(){
        
//
//        let safeArea = view.safeAreaLayoutGuide.layoutFrame
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
        print(newGame.frame.origin.y)
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
        
        player1Label = UILabel(frame: CGRect(x: (containerView.frame.size.width - 250) / 2,
                                            y: (containerView.frame.size.height - newGame.frame.origin.y + 34) / 2,
                                            width: 250,
                                            height: 40))
        
        player1Label.font = UIFont.systemFont(ofSize: 20)
        player1Label.textColor = UIColor.black
        player1Label.backgroundColor = UIColor.white
        
        
        containerView.addSubview(player1Label)
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
        
        player2Label = UILabel(frame: CGRect(x: (containerView.frame.size.width - 250) / 2,
                                             y: (containerView.frame.size.height - 40) / 2,
                                             width: 250,
                                             height: 40))
        
        player2Label.font = UIFont.systemFont(ofSize: 20)
        player2Label.backgroundColor = UIColor.white
        player2Label.textAlignment = .center
        
        containerView.addSubview(player2Label)
        
    }
}
