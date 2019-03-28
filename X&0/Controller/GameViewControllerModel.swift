//
//  GameViewControllerModel.swift
//  X&0
//
//  Created by Ionut Marinica on 21/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import Foundation
import UIKit

class GameViewControllerModel: UIViewController {
    

    var xPut = true
    
    var containerButtonView: UIView?
    var xNum: Array<Int> = []
    var oNum: Array<Int> = []
    
    var finalName1 = ""
    var finalName2 = ""
    
    var scoreX = 0
    var scoreO = 0
    var winOverlay: UILabel?
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    override var prefersStatusBarHidden: Bool { return true }
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    let bounds = UIScreen.main.bounds
    
    @IBAction func buttonNewGamePressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowYouPlayViewController")
            return
        }

        destinationVC.modalTransitionStyle = .flipHorizontal
        present(destinationVC, animated: true, completion: nil)
//        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func buttonResetGame(sender: Any) {
      
        resetGame()
    }
    
    func displayTopView(){
        
        let containerView = UIView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
//        containerView.backgroundColor = UIColor.gray
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
        label1.textAlignment = .center
        label1.font = UIFont.systemFont(ofSize: 25)
//        label1.textColor = UIColor.black
//        label1.backgroundColor = UIColor.white
        
        containerView.addSubview(label1)
    }
    
    func displayCenterView() {
        
        containerButtonView = UIView(frame: CGRect(x: 0,
                                                 y: 0.20 * bounds.size.height,
                                                 width: bounds.size.width,
                                                 height: 0.60 * bounds.size.height))
        
        containerButtonView!.backgroundColor = UIColor.white
        
        view.addSubview(containerButtonView!)
        
        let buttonWidth = containerButtonView!.frame.size.width / 3
        let buttonHeight = containerButtonView!.frame.size.height / 3
        
        for i in 0...2 {
            
            for j in 0...2{
                
                let button = XOButton(frame: CGRect(x: CGFloat(i) * buttonWidth,
                                                    y: CGFloat(j) * buttonHeight,
                                                    width: buttonWidth,
                                                    height: buttonHeight))
                
                let backgroundColor = UIColor.orange
                
                let buttonImage = getImageWithColor(color: backgroundColor,
                                                    size: button.frame.size)
            
                button.setBackgroundImage(buttonImage, for: .normal)
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.black.cgColor
              
                
                
                print(button.tag)
                containerButtonView!.addSubview(button)

                button.tag = 1 +  i + j + 2 * j
                button.addTarget(self, action: #selector(buttonSelected(sender:)), for: .touchUpInside)
            }
            
        }
        
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
        
        if (sender.currentTitle != nil) {
            return
        }
        
        var currentTitle = ""
        
        if xPut {
            
            sender.setTitle("X", for: .normal)
            sender.setBackgroundImage(getImageWithColor(color: UIColor.blue,
                                                        size: sender.frame.size),
                                      for: .normal)
            sender.index = 1
            xPut = false
            
            currentTitle = "X"
            
        } else {
            
            sender.setTitle("O", for: .normal)
            sender.index = 0
            xPut = true
            
            currentTitle = "O"
            
        }
        sender.isEnabled = false
        checker(sender.tag, currentTitle)
    }
    
    func checker(_ tag: Int, _ currentTitle: String) {
        
        let winCombinations: Array<Array<Int>> = [
            [1, 2, 3], [4, 5, 6], [7, 8, 9],
            [1, 4, 7], [2, 5, 8], [3, 6 ,9],
            [1, 5, 9], [3, 5, 7]
        ]
        
        print("---------")
        if currentTitle == "X" {
            
            xNum.insert(tag, at: xNum.count)
            
            print("Insert in xNum \(tag) at \(xNum.count)")
        } else if currentTitle == "O" {
            
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
                displayOverlay()
                
                winOverlay?.text = "\(finalName1)   WON"
                
                
                
            } else if winSet.isSubset(of: oSet) {
                
                print("\(self.finalName2) Won")
                
                scoreO += 1
                displayOverlay()
                winOverlay?.text = "\(finalName2)   WON"
                
            }
        }
        
        label1.text = "\(finalName1)    \(scoreX)"
        label2.text = "\(finalName2)    \(scoreO)"
        
    }
    
    func displayOverlay() {
        
        winOverlay = UILabel(frame: CGRect(x: 0,
                                               y: bounds.size.height,
                                               width: bounds.size.width,
                                               height: containerButtonView!.frame.size.height))
        
        winOverlay?.text = " Won"
        winOverlay?.textAlignment = .center
        winOverlay?.font = UIFont.boldSystemFont(ofSize: 30)
        winOverlay?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        winOverlay?.textColor = UIColor.white
        
        containerButtonView!.isUserInteractionEnabled = false
        
        view.addSubview(winOverlay!)
        
        UIView.animate(withDuration: 1,
                       animations:{
                        self.winOverlay?.frame.origin.y = self.containerButtonView!.frame.origin.y
                        
        }
        )
        
    }
    
    func displayBottomView() {
        
        let containerView = UIView(frame: CGRect(x: 0,
                                                 y: 0.8 * bounds.size.height,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
//        containerView.backgroundColor = UIColor.green
        view.addSubview(containerView)
        
        label2 = UILabel(frame: CGRect(x: (containerView.frame.size.width - 250) / 2,
                                             y: (containerView.frame.size.height - 40) / 2,
                                             width: 250,
                                             height: 40))
        
        label2.font = UIFont.systemFont(ofSize: 25)
//        label2.backgroundColor = UIColor.white
        label2.textAlignment = .center
        
        containerView.addSubview(label2)
        
    }
    
    func resetGame() {
        xNum.removeAll()
        oNum.removeAll()
        
        for subview in containerButtonView!.subviews{
            subview.removeFromSuperview()
        }
        
        containerButtonView?.isUserInteractionEnabled = true
        
        winOverlay?.removeFromSuperview()
        
        displayCenterView()
    }
}
