//
//  TypeOfPlayerViewControllerModel.swift
//  X&0
//
//  Created by Ionut Marinica on 21/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import Foundation
import UIKit

class TypeOfPlayerViewModel: UIViewController {
    
    override var prefersStatusBarHidden: Bool { return true }
    
    var name1 = "Player1"
    var name2 = "Player2"
    
    let bounds = UIScreen.main.bounds
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    @IBOutlet var namedLabel1: UITextField!
    @IBOutlet var namedLabel2: UITextField!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    @IBAction func backButtonPressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowToPlayViewController")
            return
        }
        
        destinationVC.modalTransitionStyle = .flipHorizontal
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    @IBAction func startButtonPressed(sender: Any) {
        
       
       
        
    }
    
    // OkButtonPressed
    @IBAction func okButton1Pressed(sender: Any) {
        
        tapedOnText1()
        dissmissKeyboard()
        
        // Set name player when okButtonPressed
        label1.text = name1 + " - X"
        namedLabel1.text = ""
       
        print("OK button 1 pressed")
        print(label1.text!)
        print(name1)
        
        
    }
    
    @IBAction func okButton2Pressed(sender: Any) {
        
        tapedOnText2()
        dissmissKeyboard()
        
        // Set name player when okButtonPressed
        label2.text = name2 + " - O"
        namedLabel2.text = ""
        print("OK button 2 pressed")
        
        
        
    }
    
        // MARK:- Set Label & TextField & Buttons
    func labelTextFieldButonFrame() {
        
        let frame = CGRect(x: 0,
                           y: 0,
                           width: bounds.size.width,
                           height: bounds.size.height)
        
        let containerView = UIView(frame: frame)
        
        view.backgroundColor = UIColor.cyan
        view.addSubview(containerView)
        
        //         Back button
        let backButton = UIButton(frame: CGRect(x: 10,
                                                y: 0.036 * bounds.size.height,
                                                width: 50,
                                                height: 50))
        
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.contentMode = .scaleAspectFill
        
        backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        
        containerView.addSubview(backButton)
        
        //Set label1
        label1 = UILabel(frame:CGRect(x: (containerView.frame.size.width - 250) / 2,
                                            y: 0.25 * containerView.frame.size.height,
                                            width: 250,
                                            height: 40))
        
        label1.text = "Player1  X"
        label1.textAlignment = .center
        label1.font = UIFont.boldSystemFont(ofSize: 30)
        
        containerView.addSubview(label1)
        
        // Set Name for Player2
        namedLabel1 = UITextField(frame: CGRect(x: (containerView.frame.size.width - 200) / 2,
                                                y: label1.frame.origin.y + 40,
                                                width: 200,
                                                height: 40))
        
        namedLabel1.placeholder = "Please Insert Your Name"
        namedLabel1.textAlignment = .center
        namedLabel1.font = UIFont.systemFont(ofSize: 18)
        namedLabel1.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        // To make UILabel to clickabel
        namedLabel1.isUserInteractionEnabled = true
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(tapedOnText1))
        tapGesture1.numberOfTapsRequired = 1
        
        namedLabel1.addGestureRecognizer(tapGesture1)
        containerView.addSubview(namedLabel1)
        
        // Ok Button for Player1
        let okButtonForPlayer1 = UIButton(frame:CGRect(x: namedLabel1.frame.origin.x - 45,
                                                       y: label1.frame.origin.y + 40,
                                                       width: 40,
                                                       height: 40))
        
        okButtonForPlayer1.setTitle("OK", for: .normal)
        okButtonForPlayer1.setTitleColor(UIColor.black, for: .normal)
        okButtonForPlayer1.setTitleColor(UIColor.white, for: .highlighted)
        
        okButtonForPlayer1.addTarget(self, action: #selector(okButton1Pressed(sender:)), for: .touchUpInside)
        
        containerView.addSubview(okButtonForPlayer1)
        
        // Set label2
        label2 = UILabel(frame: CGRect(x: (containerView.frame.size.width - 250) / 2,
                                             y: 0.4 * containerView.frame.size.height,
                                             width: 250,
                                             height: 40))
        
//        label2.text = "Player2    O"
        label2.textAlignment = .center
        label2.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        containerView.addSubview(label2)
        
        // Set Name for Player2
        namedLabel2 = UITextField(frame: CGRect(x: (containerView.frame.size.width - 200) / 2,
                                                y: label2.frame.origin.y + 40,
                                                width: 200,
                                                height: 40))
        
//        namedLabel2.placeholder = "Please Insert Your Name"
        namedLabel2.textAlignment = .center
        namedLabel2.font = UIFont.systemFont(ofSize: 18)
        namedLabel2.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        // To make UILabel to clickabel
        namedLabel2.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(tapedOnText2))
        tapGesture2.numberOfTapsRequired = 1
        
        namedLabel2.addGestureRecognizer(tapGesture2)
        
        containerView.addSubview(namedLabel2)
        
        // Ok button for Player2
        let okButtonForPlayer2 = UIButton(frame: CGRect(x: namedLabel2.frame.origin.x - 45,
                                                        y: label2.frame.origin.y + 40,
                                                        width: 40,
                                                        height: 40))
        okButtonForPlayer2.setTitle("OK", for: .normal)
        okButtonForPlayer2.setTitleColor(UIColor.black, for: .normal)
        okButtonForPlayer2.setTitleColor(UIColor.white, for: .highlighted)
        
        okButtonForPlayer2.addTarget(self, action: #selector(okButton2Pressed(sender:)), for: .touchUpInside)
        
        containerView.addSubview(okButtonForPlayer2)
        
        // Set startButton
        let startButton = UIButton(frame: CGRect(x: containerView.frame.size.width - 110,
                                                y: containerView.frame.size.height - 50,
                                                width: 100,
                                                height: 40))
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(UIColor.black, for: .normal)
        startButton.setTitleColor(UIColor.white, for: .highlighted)
        
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderWidth = 1
        startButton.layer.cornerRadius = 20
        
        startButton.addTarget(self, action: #selector(startButtonPressed(sender:)), for: .touchUpInside)
        containerView.addSubview(startButton)
        
    }
    
    // MARK: - Dissmis Keyboard
    let dissmisKeyboard = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
    
    
    @objc func dissmissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    //MARK: - When you TAP on UITextField
    @objc func tapedOnText1() {
        
        namedLabel1.becomeFirstResponder()

        namedLabel1.placeholder = namedLabel1.text
        name1 = namedLabel1.placeholder!
        
        
    }
    
    @objc func tapedOnText2() {
        
        namedLabel2.becomeFirstResponder()
        
        namedLabel2.placeholder = namedLabel2.text
        name2 = namedLabel2.placeholder!
    
    
}
    
}
