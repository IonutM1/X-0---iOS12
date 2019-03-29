//
//  GameViewControllerModel.swift
//  X&0
//
//  Created by Ionut Marinica on 21/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class GameViewControllerModel: UIViewController {
    

    var xPut = true
    
    var containerButtonView: UIView?
    // X & O Numbers
    var xNum: Array<Int> = []
    var oNum: Array<Int> = []
    
    
    var finalName1 = ""
    var finalName2 = ""
    
    var currentImage = UIImage()
    
    var scoreX = 0
    var scoreO = 0
    var winOverlay: UILabel?
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    var containerTopView = UIView()
    var containerBottomView = UIView()
    
    var button = XOButton()
    
    override var prefersStatusBarHidden: Bool { return true }
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    let bounds = UIScreen.main.bounds
    
    let winCombinations: Array<Array<Int>> = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]
    
    var player: AVAudioPlayer?
    
    // MARK: - ButtonPressed
    @IBAction func buttonNewGamePressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowYouPlayViewController")
            return
        }

        destinationVC.modalTransitionStyle = .flipHorizontal
        present(destinationVC, animated: true, completion: nil)
//        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func resetGameButtonPressed(sender: Any) {
      
        resetGame()
    }
    
    // Sound MP3
    @IBAction func soundButtonPressed(sender: Any) {
        
        if let path = Bundle.main.path(forResource: "SoundMP3", ofType: "mp3") {
            player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: "mp3")
            
            if let sound = player {
//                sound.prepareToPlay()
                sound.play()
                
            }
        }else {
            print("no sound")
        }
        
    }
    
    // MARK: - Set Label & Button
    // DisplayTopView
    func displayTopView(){
        
        containerTopView = UIView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
//        containerView.backgroundColor = UIColor.gray
        view.addSubview(containerTopView)
        
        let newGame = UIButton(frame: CGRect(x: 10,
                                             y: 0.036 * bounds.size.height,
                                             width: 100,
                                             height: 34))
        
        newGame.setTitle("New game", for: .normal)
        newGame.setTitleColor(UIColor.black, for: .normal)
        newGame.setTitleColor(UIColor.white, for: .highlighted)
        newGame.backgroundColor = UIColor.white
        newGame.layer.borderWidth = 1
        newGame.layer.borderColor = UIColor.black.cgColor
        newGame.layer.cornerRadius = 17
        
        newGame.addTarget(self, action: #selector(buttonNewGamePressed(sender:)), for: .touchUpInside)
        containerTopView.addSubview(newGame)
        
        let sound = UIButton(frame: CGRect(x: (containerTopView.frame.size.width - 50) / 2,
                                           y: 0.036 * bounds.size.height,
                                           width: 50,
                                           height: 34))
        
        sound.setImage(UIImage(named: "SoundIcon"), for: .normal)
//        sound.layer.borderWidth = 1
//        sound.layer.borderColor = UIColor.black.cgColor
//        sound.layer.cornerRadius = 17
        sound.contentMode = .scaleAspectFill
        
        sound.addTarget(self, action: #selector(soundButtonPressed(sender:)), for: .touchUpInside)
        containerTopView.addSubview(sound)
        
        let resetGame = UIButton(frame: CGRect(x: containerTopView.frame.size.width - 110,
                                               y: 0.036 * bounds.size.height,
                                               width: 100,
                                               height: 34))
        
        resetGame.setTitle("Reset", for: .normal)
        resetGame.setTitleColor(UIColor.black, for: .normal)
        resetGame.setTitleColor(UIColor.white, for: .highlighted)
        resetGame.backgroundColor = UIColor.white
        resetGame.layer.borderWidth = 1
        resetGame.layer.borderColor = UIColor.black.cgColor
        resetGame.layer.cornerRadius = 17
        
        resetGame.addTarget(self, action: #selector(resetGameButtonPressed(sender:)), for: .touchUpInside)
        containerTopView.addSubview(resetGame)
        
        label1 = UILabel(frame: CGRect(x: (containerTopView.frame.size.width - 250) / 2,
                                                 y: (containerTopView.frame.size.height - newGame.frame.origin.y + 34) / 2,
                                                 width: 250,
                                                 height: 40))
        label1.textAlignment = .center
        label1.font = UIFont.systemFont(ofSize: 25)
//        label1.textColor = UIColor.black
//        label1.backgroundColor = UIColor.white
        label1.text = finalName1
        containerTopView.addSubview(label1)
    }
    
    // DisplayCenterView
    func displayCenterView() {
        
        containerButtonView = UIView(frame: CGRect(x: 0,
                                                 y: 0.20 * bounds.size.height,
                                                 width: bounds.size.width,
                                                 height: 0.60 * bounds.size.height))
        
        containerButtonView!.backgroundColor = UIColor.white
        containerButtonView?.layer.borderColor = UIColor.white.cgColor
        containerButtonView?.layer.borderWidth = 9
        
        view.addSubview(containerButtonView!)
        
        let buttonWidth = containerButtonView!.frame.size.width / 3
        let buttonHeight = containerButtonView!.frame.size.height / 3
        
        for i in 0...2 {
            
            for j in 0...2{
                
                button = XOButton(frame: CGRect(x: CGFloat(i) * buttonWidth,
                                                    y: CGFloat(j) * buttonHeight,
                                                    width: buttonWidth,
                                                    height: buttonHeight))
                
                let backgroundColor = UIColor.white
                
                let buttonImage = getImageWithColor(color: backgroundColor,
                                                    size: button.frame.size)
            
                button.setBackgroundImage(buttonImage, for: .normal)
                button.layer.borderWidth = 8
                button.layer.borderColor = UIColor.black.cgColor
              
                
                
                print(button.tag)
                containerButtonView!.addSubview(button)

                button.tag = i + 3 * j
                button.addTarget(self, action: #selector(buttonSelected(sender:)), for: .touchUpInside)
            }
            
        }
        
    }
    
    // DisplayBottomView
    func displayBottomView() {
        
        containerBottomView = UIView(frame: CGRect(x: 0,
                                                 y: 0.8 * bounds.size.height,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
        view.addSubview(containerBottomView)
        
        label2 = UILabel(frame: CGRect(x: (containerBottomView.frame.size.width - 250) / 2,
                                       y: (containerBottomView.frame.size.height - 40) / 2,
                                       width: 250,
                                       height: 40))
        
        label2.font = UIFont.systemFont(ofSize: 25)
   
        label2.textAlignment = .center
        
        label2.text = finalName2
        
        containerBottomView.addSubview(label2)
        
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let frame = CGRect(x: 0,
                           y: 0,
                           width: size.width,
                           height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(frame)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
        
    }
    
    @objc func buttonSelected(sender: XOButton){
        
        print("Selected button with tag \(sender.tag)")
        
        if (sender.currentImage != nil) {
            return
        }
        
        if xPut {
            
            sender.setImage(UIImage(named: "XIconButton"), for: .normal)
//            sender.setBackgroundImage(getImageWithColor(color: UIColor.blue,
//                                                        size: sender.frame.size),
//                                                        for: .normal)
            sender.index = 1
            xPut = false
            
            currentImage = UIImage(named: "XIconButton")!
            
        } else {
            
            sender.setImage(UIImage(named: "OIconButton"), for: .normal)
            sender.index = 0
            xPut = true
            
            currentImage = UIImage(named: "OIconButton")!
            
        }
        sender.isEnabled = false
        checker(sender.tag, currentImage)
    }
    
    func checker(_ tag: Int, _ currentImage: UIImage) {
        
        print("---------")
        if currentImage == UIImage(named: "XIconButton")! {
            
            xNum.insert(tag, at: xNum.count)
            
            print("Insert in xNum \(tag) at \(xNum.count)")
        } else if currentImage == UIImage(named: "OIconButton")! {
            
            oNum.insert(tag, at: oNum.count)
            
            print("Insert in oNum \(tag) at \(oNum.count)")
        }
        
        print("xNum.count is \(xNum.count)")
        print("oNum.count is \(oNum.count)")
        
        let xSet = Set(xNum)
        let oSet = Set(oNum)
        
        for winCombination in winCombinations {
            
            let winSet = Set(winCombination)
            
            if(winSet.isSubset(of: xSet)){
                
                print("\(self.finalName1) won")
                
                scoreX += 1
                
                label1.text = "\(finalName1)    WINNER!"
                containerTopView.backgroundColor = UIColor.green
               
                label2.text = "\(finalName2)    LOSER"
                containerBottomView.backgroundColor = UIColor.red
                
                  containerButtonView!.isUserInteractionEnabled = false
//                displayOverlay()
//                winOverlay?.text = "\(finalName1)   WON"
                
            } else if winSet.isSubset(of: oSet) {
                
                print("\(self.finalName2) Won")
                
                scoreO += 1
                
                label1.text = "\(finalName1)    LOSER!"
                containerTopView.backgroundColor = UIColor.red
                
                label2.text = "\(finalName2)    WINNER"
                containerBottomView.backgroundColor = UIColor.green
                
//                displayOverlay()
//                winOverlay?.text = "\(finalName2)   WON"
                  containerButtonView!.isUserInteractionEnabled = false
            }
        }
        
//        label1.text = "\(finalName1)    \(scoreX)"
//        label2.text = "\(finalName2)    \(scoreO)"
        
    }
    
    func displayOverlay() {
        
        winOverlay = UILabel(frame: CGRect(x: 0,
                                               y: bounds.size.height,
                                               width: bounds.size.width,
                                               height: containerButtonView!.frame.size.height))
        
//        winOverlay?.text = " Won"
        winOverlay?.textAlignment = .center
        winOverlay?.font = UIFont.boldSystemFont(ofSize: 30)
        winOverlay?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        winOverlay?.textColor = UIColor.white
        
        containerButtonView!.isUserInteractionEnabled = false
        
        view.addSubview(winOverlay!)
        
        UIView.animate(withDuration: 1,
                       animations:{
                        self.winOverlay?.frame.origin.y = self.containerButtonView!.frame.origin.y
                        })
    }
    
    // MARK: - ResetGame
    func resetGame() {
        xNum.removeAll()
        oNum.removeAll()
        
        containerTopView.backgroundColor = UIColor.white
        containerBottomView.backgroundColor = UIColor.white
        
        label1.text = "\(finalName1)    \(scoreX)"
        label2.text = "\(finalName2)    \(scoreO)"
        
        for subview in containerButtonView!.subviews{
            subview.removeFromSuperview()
        }
        
        containerButtonView?.isUserInteractionEnabled = true
        
        winOverlay?.removeFromSuperview()
        
        displayCenterView()
    }
    
}
