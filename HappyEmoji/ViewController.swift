//
//  ViewController.swift
//  HappyEmoji
//
//  Created by Brendan Lau on 3/19/17.
//  Copyright © 2017 Brendan Lau. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
   
   @IBOutlet weak var squareOne: UIButton!
   @IBOutlet weak var squareTwo: UIButton!
   @IBOutlet weak var squareThree: UIButton!
   @IBOutlet weak var squareFour: UIButton!
   
   var emojiScene: EmojiScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiScene = EmojiScene(size: view.bounds.size)
        emojiScene.scaleMode = .resizeFill
        
        let emojiView = SKView(frame: view.frame)
        
        emojiView.allowsTransparency = true
        emojiView.isUserInteractionEnabled = false
        emojiView.showsFPS = false
        emojiView.showsNodeCount = false
        emojiView.ignoresSiblingOrder = true
        emojiView.presentScene(emojiScene)
        
        view.addSubview(emojiView)
        
        // Give a white background
        let backgroundView = UIView(frame: view.frame)
        backgroundView.backgroundColor = UIColor.white
        view.addSubview(backgroundView)
        view.sendSubview(toBack: backgroundView)

        let squareSize = CGSize(width: view.frame.size.height / 10.0, height: view.frame.size.height / 10.0)
        _formatButtons(squareSize: squareSize) // set pretty colors & constraints
    }
   
   // MARK: IBActions
   
   /* In SKScenes, the coordinate axis is the inverse of the apple standard,
      so we need to adjust the center we send to the scene accordingly */
   
   @IBAction func squareOneDidPress(_ sender: UIButton) { emojiScene.sendFire(origin: squareThree.center) }
   
   @IBAction func squareTwoDidPress(_ sender: UIButton) { emojiScene.sendShit(origin: squareFour.center) }
   
   @IBAction func squareThreeDidPress(_ sender: UIButton) { emojiScene.sendMerica(origin: squareOne.center) }
   
   @IBAction func squareFourDidPress(_ sender: UIButton) { emojiScene.sendKitty(origin: squareTwo.center) }
   
}

