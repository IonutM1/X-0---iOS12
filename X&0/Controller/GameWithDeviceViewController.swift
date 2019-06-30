//
//  GameWithDeviceViewController.swift
//  X&0
//
//  Created by Ionut Marinica on 16/03/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

class GameWithDeviceViewController: GameViewControllerModel {
    
    //MARK: - Tic Tac Toe image
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var img3: UIImageView!
    @IBOutlet var img4: UIImageView!
    @IBOutlet var img5: UIImageView!
    @IBOutlet var img6: UIImageView!
    @IBOutlet var img7: UIImageView!
    @IBOutlet var img8: UIImageView!
    @IBOutlet var img9: UIImageView!
    
    //MARK: - Tic Tac Toe Button
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btn7: UIButton!
    @IBOutlet var btn8: UIButton!
    @IBOutlet var btn9: UIButton!

    @IBOutlet var message: UILabel!
    
    var resetBtn: UIButton!
    var newGame: UIButton!

    var plays = Dictionary<Int,Int>()
    var done = false
    var aiDeciding = false
    
    //MARK: - UI Button Clicked
    @IBAction func UIButtonClicked(_ sender : UIButton){
        message.isHidden = true
        if((plays[sender.tag] == nil) && !aiDeciding && !done){
            setImageForSpot(spot: sender.tag, player: 1)
        }
        checkForWin()
        aiTurn()
    }
    //MARK: - Set image for spot
    func setImageForSpot(spot:Int, player:Int){
        let playerMark = player == 1 ? "XIconButton" : "OIconButton"
        plays[spot] = player
        switch spot{
        case 1:
            img1.image = UIImage(named: playerMark)
        case 2:
            img2.image = UIImage(named: playerMark)
        case 3:
            img3.image = UIImage(named: playerMark)
        case 4:
            img4.image = UIImage(named: playerMark)
        case 5:
            img5.image = UIImage(named: playerMark)
        case 6:
            img6.image = UIImage(named: playerMark)
        case 7:
            img7.image = UIImage(named: playerMark)
        case 8:
            img8.image = UIImage(named: playerMark)
        case 9:
            img9.image = UIImage(named: playerMark)
        default:
            img5.image = UIImage(named: playerMark)
        }
    }
    
    //MARK: - Check for win
    func checkForWin(){
        let whoWon = ["I":0,"You":1]
        for(key,value) in whoWon{
            if((plays[7] == value && plays[8] == value && plays[9] == value) || //bottom row match
                (plays[4] == value && plays[5] == value && plays[6] == value) || //middle row match
                (plays[1] == value && plays[2] == value && plays[3] == value) || //top row match
                (plays[1] == value && plays[4] == value && plays[7] == value) || //first col match
                (plays[2] == value && plays[5] == value && plays[8] == value) || //sec col match
                (plays[3] == value && plays[6] == value && plays[9] == value) || //third col match
                (plays[1] == value && plays[5] == value && plays[9] == value) || //first cross
                (plays[3] == value && plays[5] == value && plays[7] == value) //second cross
                ){
                message.isHidden = false
                message.text = "Looks like \(key) won"
               
                done = true
            }
        }
        
    }
    
    func checkBottom(value:Int) -> (location:String, pattern:String){
        return ("bottom", checkFor(value: value, inList: [7,8,9]))
    }
    
    func checkTop(value:Int) -> (location:String, pattern:String){
        return ("top", checkFor(value: value, inList: [1,2,3]))
    }
    
    func checkLeft(value:Int) -> (location:String, pattern:String){
        return ("left", checkFor(value: value, inList: [1,4,7]))
    }
    
    func checkRight(value:Int) -> (location:String, pattern:String){
        return ("right", checkFor(value: value, inList: [3,6,9]))
    }
    
    func checkMiddleAcross(value:Int) -> (location:String, pattern:String){
        return ("middleAcross", checkFor(value: value, inList: [4,5,6]))
    }
    
    func checkMiddleDown(value:Int) -> (location:String, pattern:String){
        return ("middleDown", checkFor(value: value, inList: [2,5,8]))
    }
    
    func checkDiagLeftRight(value:Int) -> (location:String, pattern:String){
        return ("diagLeftRight", checkFor(value: value, inList: [1,5,9]))
    }
    
    func checkDiagRightLeft(value:Int) -> (location:String, pattern:String){
        return ("diagRightLeft", checkFor(value: value, inList: [3,5,7]))
    }
    
    func checkFor(value:Int, inList:[Int]) -> String {
        var conclusion = ""
        for cell in inList {
            if(plays[cell] == value){
                conclusion.append("1")
            }else{
                conclusion.append("0")
            }
        }
        return conclusion
    }
    
    //MARK: - AI TURN
    func rowCheck(value:Int) -> (location:String,pattern:String){
        let acceptableFinds = ["110","101","011"]
        let findFuncs = [checkTop, checkBottom, checkLeft, checkRight, checkMiddleAcross, checkMiddleDown, checkDiagLeftRight, checkDiagRightLeft]
        for algorithm in findFuncs{
            let algorithmResults = algorithm(value)
            if acceptableFinds.contains(algorithmResults.pattern) {
                return algorithmResults
            }
        }
        return ("","")
    }
    
    //Where to play
    func whereToPlay(location:String, pattern:String) -> Int{
        let leftPattern = "011"
        let rightPattern = "110"
        
        switch location{
        case "top":
            if(pattern == leftPattern){
                return 1
            }else if(pattern == rightPattern){
                return 3
            }else{
                return 2
            }
        case "bottom":
            if(pattern == leftPattern){
                return 7
            }else if(pattern == rightPattern){
                return 9
            }else{
                return 8
            }
        case "left":
            if(pattern == leftPattern){
                return 1
            }else if(pattern == rightPattern){
                return 7
            }else{
                return 4
            }
        case "right":
            if(pattern == leftPattern){
                return 3
            }else if(pattern == rightPattern){
                return 9
            }else{
                return 6
            }
        case "middleAcross":
            if(pattern == leftPattern){
                return 4
            }else if(pattern == rightPattern){
                return 6
            }else{
                return 5
            }
        case "middleDown":
            if(pattern == leftPattern){
                return 2
            }else if(pattern == rightPattern){
                return 8
            }else{
                return 5
            }
        case "diagLeftRight":
            if(pattern == leftPattern){
                return 1
            }else if(pattern == rightPattern){
                return 9
            }else{
                return 5
            }
        case "diagRightLeft":
            if(pattern == leftPattern){
                return 3
            }else if(pattern == rightPattern){
                return 7
            }else{
                return 5
            }
        default:
            return 4
        }
    }
    
    func isOccupied(spot:Int) -> Bool{
        return (plays[spot] != nil) ? true : false
    }
    
    func firstAvailable(corner:Bool) -> Int{
        let spots = corner ? [1,3,7,9] : [2,4,6,8]
        for spot in spots {
            if(!isOccupied(spot: spot)){
                return spot
            }
        }
        return 0
    }
    
    // func aiTurn
    func aiTurn(){
        if(done){
            return
        }else{
            aiDeciding = true
            
            var result = rowCheck(value: 0)
            if result != ("","") {
                let whereToPlayResult = whereToPlay(location: result.location, pattern: result.pattern)
                if(!isOccupied(spot: whereToPlayResult)){
                    setImageForSpot(spot: whereToPlayResult, player: 0)
                    aiDeciding = false
                    checkForWin()
                    return
                }
            }
            
            result = rowCheck(value: 1)
            if result != ("","") {
                let whereToPlayResult = whereToPlay(location: result.location, pattern: result.pattern)
                if(!isOccupied(spot: whereToPlayResult)){
                    setImageForSpot(spot: whereToPlayResult, player: 0)
                    aiDeciding = false
                    checkForWin()
                    return
                }
            }
            
            if(!isOccupied(spot: 5)){
                setImageForSpot(spot: 5, player: 0)
                aiDeciding = false
                checkForWin()
                return
            }
            
            let cornerAvailable = firstAvailable(corner : true)
            if(cornerAvailable != 0){
                setImageForSpot(spot: cornerAvailable, player: 0)
                aiDeciding = false
                checkForWin()
                return
            }
            
            let sideAvailable = firstAvailable(corner : false)
            if(sideAvailable != 0){
                setImageForSpot(spot: sideAvailable, player: 0)
                aiDeciding = false
                checkForWin()
                return
            }
            
            message.isHidden = false
            message.text = "Looks like its a tie!"
            
            reset()
            
            aiDeciding = false
        }
    }
    
//    MARK: - reset button clicked
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        done = false
        message.isHidden = true
        reset()
    }
    
    // func reset
    func reset(){
        plays = [:]
        img1.image = nil
        img2.image = nil
        img3.image = nil
        img4.image = nil
        img5.image = nil
        img6.image = nil
        img7.image = nil
        img8.image = nil
        img9.image = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayBtnNewGameAndReset()
        
    }
    
    //MARK: - Display button NewGame & Reset
    func displayBtnNewGameAndReset(){
        containerBottomView = UIView(frame: CGRect(x: 0,
                                                   y: 0.80 * bounds.size.height,
                                                   width: bounds.size.width,
                                                   height: 0.20 * bounds.size.height))
        
        view.addSubview(containerBottomView)
        
        newGame = UIButton(frame: CGRect(x: 10,
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
        
        resetBtn = UIButton(frame: CGRect(x: containerBottomView.frame.size.width - 110,
                                               y: containerBottomView.frame.height - (0.020 * bounds.size.height + 34),
                                               width: 100,
                                               height: 34))
        
        resetBtn.addTarget(self, action: #selector(resetBtnClicked(_:)), for: .touchUpInside)
        
        resetBtn.setTitle("Reset", for: .normal)
        resetBtn.setTitleColor(UIColor.black, for: .normal)
        resetBtn.setTitleColor(UIColor.white, for: .highlighted)
        resetBtn.backgroundColor = UIColor.white
        resetBtn.layer.borderWidth = 1
        resetBtn.layer.borderColor = UIColor.black.cgColor
        resetBtn.layer.cornerRadius = 17
        
        containerBottomView.addSubview(resetBtn)
        
    }
    
}

