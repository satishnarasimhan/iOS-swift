//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Satish Narasimhan on 10/2/17.
//  Copyright © 2017 SatishNarasimhan. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [1, 4, 7], [2, 5, 8], [3, 4, 5], [2, 4, 6], [6, 7, 8]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
        
        if (gameState[sender.tag - 1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag - 1] = activePlayer
            if (activePlayer == 1)
            {
            sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
            activePlayer = 2
            }
            else
            {
            sender.setImage(UIImage(named: "O.png"), for: UIControlState())
            activePlayer = 1
            }
            
        }
        
        for combinations in winningCombinations
        {
            if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]]
            {
                gameIsActive = false
                
                if (gameState[combinations[0]] == 1)
                {
                    label.text = "Cross has won !!"
                }
                else
                {
                   label.text = "O has won !!"
                }
                playAgain.isHidden = false
                label.isHidden = false
            }
        }
        
        var count = 1
        
        if gameIsActive == true
        {
            for i in gameState
            {
                count = i*count
            }
            if (count != 0)
            {
                label.text = "Game Drawn !!"
                label.isHidden = false
                playAgain.isHidden = false
            }
        }
    }
    
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgain.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
