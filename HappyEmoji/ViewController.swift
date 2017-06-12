//
//  ViewController.swift
//  HappyEmoji
//
//  Created by Brendan Lau on 3/19/17.
//  Copyright © 2017 Brendan Lau. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController /*UIViewControllerPreviewingDelegate*/ {
    
    @IBOutlet weak var squareOne: UIButton!
    @IBOutlet weak var squareTwo: UIButton!
    @IBOutlet weak var squareThree: UIButton!
    @IBOutlet weak var squareFour: UIButton!
    
    var emojiScene: EmojiScene!
    var timer: Timer!
    let repeatInterval = TimeInterval(0.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //if (traitCollection.forceTouchCapability == .available) {
          //  registerForPreviewing(with: self, sourceView: view)
        //}
        
//        for i in 0x1F601...0x1F64F {
//            let emoji = String(describing: UnicodeScalar(i))
//            
//        }

//        let emojis = ["❤️", "🐈", "💩", "🔥"]
//        for emoji in emojis {
//            let uni = emoji.unicodeScalars
//            let unicode = uni[uni.startIndex].value
//            print(String(unicode, radix: 16, uppercase: true))
//        }

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
    
    
    // UIViewControllerPreviewingDelegate Implementation
    /*
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let pickerVC = storyboard?.instantiateViewController(withIdentifier: "EmojiPickerDetailViewController") as? EmojiPickerDetailViewController
            else { return nil }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
    }*/
    
    
    // MARK: IBActions

    // Fire Emojis
    
    @IBAction func squareOneDidPress(_ sender: UIButton) {

        // Single shot
        emojiScene.sendEmoji(sender: squareOne, emoji: "🔥")

        // Repeating
        timer = Timer.scheduledTimer(timeInterval: repeatInterval, target: self.emojiScene, selector: #selector(self.emojiScene.sendEmoji(sender:)), userInfo: (squareOne, "🔥"), repeats: true)
    }
    
    @IBAction func squareTwoDidPress(_ sender: UIButton) {
        
        // Single shot
        emojiScene.sendEmoji(sender: squareTwo, emoji: "💩")
        
        // Repeating
        timer = Timer.scheduledTimer(timeInterval: repeatInterval, target: self.emojiScene, selector: #selector(self.emojiScene.sendEmoji(sender:)), userInfo: (squareTwo, "💩"), repeats: true)
    }
    
    @IBAction func squareThreeDidPress(_ sender: UIButton) {
        
        // Single shot
        emojiScene.sendEmoji(sender: squareThree, emoji: "❤️")
        
        // repeating
        timer = Timer.scheduledTimer(timeInterval: repeatInterval, target: self.emojiScene, selector: #selector(self.emojiScene.sendEmoji(sender:)), userInfo: (squareThree, "❤️"), repeats: true)
    }
    
    @IBAction func squareFourDidPress(_ sender: UIButton) {
        
        // Single shot
        emojiScene.sendEmoji(sender: squareFour, emoji: "🐈")
        
        // repeating
        timer = Timer.scheduledTimer(timeInterval: repeatInterval, target: self.emojiScene, selector: #selector(self.emojiScene.sendEmoji(sender:)), userInfo: (squareFour, "🐈"), repeats: true)
    }
    
    // Stop Firing Emojis
    
    @IBAction func squareOneDidReleaseInside(_ sender: UIButton) { timer.invalidate() }
    
    @IBAction func squareTwoDidReleaseInside(_ sender: UIButton) { timer.invalidate() }
    
    @IBAction func squareThreeDidReleaseInside(_ sender: UIButton) { timer.invalidate() }
    
    @IBAction func squareFourDidReleaseInside(_ sender: UIButton) { timer.invalidate() }

}

