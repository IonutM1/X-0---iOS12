//
//  PreparingGameViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class PlayerVsPlayerViewController: UIViewController, UITextFieldDelegate {
    
    var name = ""
    
    let bounds = UIScreen.main.bounds
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let dissmisKeyboard = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
    
    @IBOutlet var namePlayer1: UITextField!
    @IBOutlet var namePlayer2: UITextField!
    
    @IBOutlet var player1Label: UILabel!
    @IBOutlet var player2Label: UILabel!

    override var prefersStatusBarHidden: Bool { return true }
    
    @IBAction func backButtonPressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowToPlayViewController")
            return
        }
        
        destinationVC.modalTransitionStyle = .crossDissolve
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    @IBAction func nextButtonPressed(sender: Any) {
        
        guard let destinationVC = self.mainStoryboard.instantiateViewController(withIdentifier: "GameWithPlayerViewController") as? GameWithPlayerViewController else {
            print("Couldn't find to GameWithPlayerViewController")
            return
        }
        
//        destinationVC.modalTransitionStyle = .partialCurl
        present(destinationVC, animated: true, completion: nil)
        
//        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func okButton1Pressed(sender: Any) {

        tapOnText1()
        dissmissKeyboard()
        
        // Set name player when okButtonPressed
        player1Label.text = name + " -X"
        namePlayer1.text = ""
        print("OK button 1 pressed")
    }
    
    @IBAction func okButton2Pressed(sender: Any) {
        
        tapOnText2()
        dissmissKeyboard()
        
        // Set name player when okButtonPressed
        player2Label.text = name + " -O"
        namePlayer2.text = ""
        print("OK button 2 pressed")
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTextFieldButonFrame()
        
    }
    
    // MARK:- Set Label & TextField & Buttons
    func labelTextFieldButonFrame(){
        
        let frame = CGRect(x: 0,
                           y: 0,
                           width: bounds.size.width,
                           height: bounds.size.height)
        
        let containerView = UIView(frame: frame)
        
        view.backgroundColor = UIColor.cyan
        view.addSubview(containerView)
        
        // Back button
        let backButton = UIButton(frame: CGRect(x: 10,
                                                y: 0.036 * bounds.size.height,
                                                width: 50,
                                                height: 50))
        
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.contentMode = .scaleAspectFit
        
        backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
        
        containerView.addSubview(backButton)
        
        //Set Player1Label
        player1Label = UILabel(frame:CGRect(x: (containerView.frame.size.width - 250) / 2,
                                           y: 0.25 * containerView.frame.size.height,
                                           width: 250,
                                           height: 40))
        
        player1Label.text = "Player1    X"
        player1Label.textAlignment = .center
        player1Label.font = UIFont.boldSystemFont(ofSize: 30)
        
        containerView.addSubview(player1Label)
        
        // Set Name for Player2
        namePlayer1 = UITextField(frame: CGRect(x: (containerView.frame.size.width - 200) / 2,
                                                    y: player1Label.frame.origin.y + 40,
                                                    width: 200,
                                                    height: 40))
        
        namePlayer1.placeholder = "Please Insert Your Name"
        namePlayer1.textAlignment = .center
        namePlayer1.font = UIFont.systemFont(ofSize: 18)
        namePlayer1.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        // To make UILabel to clickabel
        namePlayer1.isUserInteractionEnabled = true

        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(tapOnText1))
        tapGesture1.numberOfTapsRequired = 1

        namePlayer1.addGestureRecognizer(tapGesture1)
        containerView.addSubview(namePlayer1)
        
        // Ok Button for Player1
        let okButtonForPlayer1 = UIButton(frame:CGRect(x: namePlayer1.frame.origin.x - 45,
                                           y: player1Label.frame.origin.y + 40,
                                           width: 40,
                                           height: 40))

        okButtonForPlayer1.setTitle("OK", for: .normal)
        okButtonForPlayer1.setTitleColor(UIColor.black, for: .normal)
        okButtonForPlayer1.setTitleColor(UIColor.white, for: .highlighted)
        
        okButtonForPlayer1.addTarget(self, action: #selector(okButton1Pressed(sender:)), for: .touchUpInside)
        
        containerView.addSubview(okButtonForPlayer1)
        
        // Set Player2Label
        player2Label = UILabel(frame: CGRect(x: (containerView.frame.size.width - 250) / 2,
                                            y: 0.4 * containerView.frame.size.height,
                                            width: 250,
                                            height: 40))
       
        player2Label.text = "Player2    O"
        player2Label.textAlignment = .center
        player2Label.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        containerView.addSubview(player2Label)
        
        // Set Name for Player2
        namePlayer2 = UITextField(frame: CGRect(x: (containerView.frame.size.width - 200) / 2,
                                                    y: player2Label.frame.origin.y + 40,
                                                    width: 200,
                                                    height: 40))
    
        namePlayer2.placeholder = "Please Insert Your Name"
        namePlayer2.textAlignment = .center
        namePlayer2.font = UIFont.systemFont(ofSize: 18)
        namePlayer2.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        // To make UILabel to clickabel
        namePlayer2.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(tapOnText2))
        tapGesture2.numberOfTapsRequired = 1
        
        namePlayer2.addGestureRecognizer(tapGesture2)
        containerView.addSubview(namePlayer2)
        
        // Ok button for Player2
        let okButtonForPlayer2 = UIButton(frame: CGRect(x: namePlayer2.frame.origin.x - 45,
                                                        y: player2Label.frame.origin.y + 40,
                                                        width: 40,
                                                        height: 40))
        okButtonForPlayer2.setTitle("OK", for: .normal)
        okButtonForPlayer2.setTitleColor(UIColor.black, for: .normal)
        okButtonForPlayer2.setTitleColor(UIColor.white, for: .highlighted)
        
        okButtonForPlayer2.addTarget(self, action: #selector(okButton2Pressed(sender:)), for: .touchUpInside)
        
        containerView.addSubview(okButtonForPlayer2)
        
        // Set NextButton
        let nextButton = UIButton(frame: CGRect(x: containerView.frame.size.width - 110,
                                                y: containerView.frame.size.height - 50,
                                                width: 100,
                                                height: 40))
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .highlighted)
        
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.borderWidth = 1
        nextButton.layer.cornerRadius = 20
        
        nextButton.addTarget(self, action: #selector(nextButtonPressed(sender:)), for: .touchUpInside)
        containerView.addSubview(nextButton)
        
    }
    
    //MARK: - When you TAP on UITextField
    @objc func tapOnText1() {

        namePlayer1.becomeFirstResponder()
        name = namePlayer1.text!
        
    }
    
    @objc func tapOnText2() {
        
        namePlayer2.becomeFirstResponder()
        name = namePlayer2.text!
        
    }
    
    // MARK: - Dissmis Keyboard
    @objc func dissmissKeyboard() {
        
        view.endEditing(true)
        
    }

}
