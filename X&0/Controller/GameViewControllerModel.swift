//
//  GameViewControllerModel.swift
//  X&0
//
//  Created by Ionut Marinica on 21/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewControllerModel: UIViewController {
    
    let player = Sound()
    var sound = UIButton()
    
    var xPut = true
    var equal = true
    
    // X & O Numbers
    var xNum: Array<Int> = []
    var oNum: Array<Int> = []
    
    
    var finalName1 = ""
    var finalName2 = ""
    
    var currentImage = UIImage()
    
    var scoreX = 0
    var scoreO = 0
    var winOverlay: UILabel?
    var winOverlay2: UILabel?
    var equalOverlay: UILabel?
    
    var scoreXLabel: UILabel?
    var scoreOLabel: UILabel?
    
    let colorGreen = #colorLiteral(red: 0.3019607843, green: 1, blue: 0.5333333333, alpha: 1)
    let colorRed = #colorLiteral(red: 1, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
    let colorForPlayerIsTurn = #colorLiteral(red: 0.5142127872, green: 0.8756996393, blue: 1, alpha: 1)
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    var containerButtonView: UIView?
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
    
    // MARK: - ButtonPressed
    @IBAction func buttonNewGamePressed(sender: Any) {
        
        guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "HowYouPlayViewController") as? HowYouPlayViewController else {
            print("Couldn't find to HowYouPlayViewController")
            return
        }
        
        dismiss(animated: true, completion: nil)
        destinationVC.modalTransitionStyle = .flipHorizontal
        present(destinationVC, animated: true, completion: nil)
//        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func resetGameButtonPressed(sender: Any) {
      
        resetGame()
    }
    
    @IBAction func soundOnButtonPressed(sender: Any) {
        
        player.soundOn()
        
        sound.isUserInteractionEnabled = false
        
    }
    
    @IBAction func soundOffButtonPressed(sender: Any) {
        
        player.soundOff()
        
        sound.isUserInteractionEnabled = true
        
    }
    
    // MARK: - Set Label & Button
    // DisplayTopView
    func displayTopView(){
        
        containerTopView = UIView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
//        containerTopView.backgroundColor = #colorLiteral(red: 1, green: 0.7175391912, blue: 0.4974026084, alpha: 1)
        view.addSubview(containerTopView)

        
        label1 = UILabel(frame: CGRect(x: (containerTopView.frame.size.width - 300) / 2,
                                       y: (containerTopView.frame.size.height - (0.036 * bounds.size.height)) / 2,
                                       width: 300,
                                       height: 40))
        label1.textAlignment = .center
        label1.font = UIFont.systemFont(ofSize: 25)
        label1.layer.cornerRadius = 20
        label1.layer.backgroundColor = colorForPlayerIsTurn.cgColor
        
        label1.text = finalName1
        containerTopView.addSubview(label1)
        
        // scoreLabel
        scoreXLabel = UILabel(frame: CGRect(x: (containerTopView.frame.size.width - 90) / 2,
                             y: label1.frame.origin.y + 40,
                             width: 90,
                             height: 20))
        scoreXLabel?.font = UIFont.systemFont(ofSize: 18)
        
        scoreXLabel?.textColor = UIColor.black
        scoreXLabel?.textAlignment = .center
        containerTopView.addSubview(scoreXLabel!)
        
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
                                                 y: 0.80 * bounds.size.height,
                                                 width: bounds.size.width,
                                                 height: 0.20 * bounds.size.height))
        
        view.addSubview(containerBottomView)
        
        label2 = UILabel(frame: CGRect(x: (containerBottomView.frame.size.width - 300) / 2,
                                       y: (containerBottomView.frame.size.height - 80) / 2,
                                       width: 300,
                                       height: 40))
        
        label2.font = UIFont.systemFont(ofSize: 25)
        label2.layer.cornerRadius = 20

        label2.textAlignment = .center
        
        label2.text = finalName2
        
        containerBottomView.addSubview(label2)
        
        scoreOLabel = UILabel(frame: CGRect(x: (containerBottomView.frame.size.width - 90) / 2,
                                            y: label2.frame.origin.y - 20,
                                            width: 90,
                                            height: 20))
        
        scoreOLabel?.font = UIFont.systemFont(ofSize: 18)
        scoreOLabel?.textAlignment = .center
        scoreOLabel?.textColor = UIColor.black
       
        containerBottomView.addSubview(scoreOLabel!)
        
        let newGame = UIButton(frame: CGRect(x: 10,
                                             y: containerBottomView.frame.height - (0.020 * bounds.size.height + 34),
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
        
        containerBottomView.addSubview(newGame)
        
        let resetGame = UIButton(frame: CGRect(x: containerTopView.frame.size.width - 110,
                                               y: containerBottomView.frame.height - (0.020 * bounds.size.height + 34),
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
        
        containerBottomView.addSubview(resetGame)
        
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
            sender.index = 1
            
            
            
            label1.layer.backgroundColor = UIColor.white.cgColor
            currentImage = UIImage(named: "XIconButton")!
            
            xPut = false
        
            label2.layer.backgroundColor = colorForPlayerIsTurn.cgColor
        } else {
            
            sender.setImage(UIImage(named: "OIconButton"), for: .normal)
            sender.index = 0
            
            label1.layer.backgroundColor = colorForPlayerIsTurn.cgColor
            
            currentImage = UIImage(named: "OIconButton")!
            xPut = true

            label2.layer.backgroundColor = UIColor.white.cgColor
            
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
                
                displayOverlay()
                equal = false
                
                scoreX += 1
                scoreXLabel?.text = "Score \(scoreX)"
                scoreOLabel?.text = "Score \(scoreO)"
                
                print("\(self.finalName1) won")
                
                
                
                label1.text = "\(finalName1)    GREAT!"
                
                containerTopView.backgroundColor = colorGreen
               
                label2.text = "\(finalName2)    TRY AGAIN!"
                containerBottomView.backgroundColor = colorRed
            
                winOverlay?.text = "WINNER!"
                winOverlay?.textColor = colorGreen
                winOverlay?.font = UIFont.boldSystemFont(ofSize: 80)
                
                winOverlay2?.text = "LOSER!"
                winOverlay2?.textColor = colorRed
                winOverlay2?.font = UIFont.boldSystemFont(ofSize: 50)
                
            } else if winSet.isSubset(of: oSet) {
              
                displayOverlay()
                
                equal = false
                
                print("\(self.finalName2) Won")
                
                scoreO += 1
                scoreXLabel?.text = "Score \(scoreX)"
                scoreOLabel?.text = "Score \(scoreO)"
                
                label1.text = "\(finalName1)    TRY AGAIN!"
                
                containerTopView.backgroundColor = colorRed
                
                label2.text = "\(finalName2)    GREAT!"
                containerBottomView.backgroundColor = colorGreen
                
                winOverlay?.text = "LOSER"
                winOverlay?.textColor = colorRed
                winOverlay?.font = UIFont.boldSystemFont(ofSize: 50)
                
                winOverlay2?.text = "WINNER!"
                winOverlay2?.textColor = colorGreen
                winOverlay2?.font = UIFont.boldSystemFont(ofSize: 80)
                
            }
            
        }
        if equal == true && (xNum.count == 5 || oNum.count == 5){
            
            print("equal")
            displayEqualOverlay()
            equalOverlay?.text = "DRAW!"
            equalOverlay?.textColor = UIColor.white
            equalOverlay?.font = UIFont.boldSystemFont(ofSize: 70)
            
        }
        
    }
    
    func displayOverlay() {
        
        winOverlay = UILabel(frame: CGRect(x: 0,
                                               y: bounds.size.height - bounds.size.height,
                                               width: bounds.size.width,
                                               height: containerButtonView!.frame.size.height / 2))
        
        winOverlay?.textAlignment = .center
        
        winOverlay?.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        winOverlay?.shadowColor = UIColor.white
        
        view.addSubview(winOverlay!)
        
        UIView.animate(withDuration: 1.5,
                       animations:{
                        self.winOverlay?.frame.origin.y = self.containerButtonView!.frame.origin.y
                        })
        
        winOverlay2 = UILabel(frame: CGRect(x: 0,
                                           y: bounds.size.height,
                                           width: bounds.size.width,
                                           height: containerButtonView!.frame.size.height / 2))
        
        winOverlay2?.textAlignment = .center
        
        winOverlay2?.backgroundColor = UIColor.black.withAlphaComponent(0.9)

        winOverlay2?.shadowColor = UIColor.white
        
        view.addSubview(winOverlay2!)
        
        UIView.animate(withDuration: 1.5,
                       animations: {self.winOverlay2?.frame.origin.y = 0.50 * self.bounds.size.height})
      
        containerButtonView!.isUserInteractionEnabled = false
        
    }
    
    func displayEqualOverlay(){
        equalOverlay = UILabel(frame: CGRect(x: 0,
                                     y: bounds.size.height - bounds.size.height,
                                     width: bounds.size.width,
                                     height: containerButtonView!.frame.size.height))
        
        equalOverlay?.textAlignment = .center

        equalOverlay?.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        view.addSubview(equalOverlay!)
        
        UIView.animate(withDuration: 1.5,
                       animations: {self.equalOverlay?.frame.origin.y = self.containerButtonView!.frame.origin.y})
        
        containerButtonView!.isUserInteractionEnabled = false
        
    }
    
    // MARK: - ResetGame
    func resetGame() {
        xNum.removeAll()
        oNum.removeAll()
        equal = true
        
        containerTopView.backgroundColor = UIColor.white
        containerBottomView.backgroundColor = UIColor.white
        
        
        
        label1.text = "\(finalName1)"
        label2.text = "\(finalName2)"
        
        for subview in containerButtonView!.subviews{
            subview.removeFromSuperview()
        }
        
        containerButtonView?.isUserInteractionEnabled = true
        
        winOverlay?.removeFromSuperview()
        
        displayCenterView()
    }
    
}
