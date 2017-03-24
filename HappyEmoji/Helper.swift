//
//  Helper.swift
//  HappyEmoji
//
//  Created by Brendan Lau on 3/20/17.
//  Copyright © 2017 Brendan Lau. All rights reserved.
//

import Foundation
import UIKit


func random() -> CGFloat {
   return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random(min: CGFloat, max: CGFloat) -> CGFloat {
   return random() * (max - min) + min
}

extension ViewController {
   
    public func _imageWithColor(color: UIColor, size: CGSize) -> UIImage {
      
      let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
      UIGraphicsBeginImageContextWithOptions(size, false, 0)
      color.setFill()
      UIRectFill(rect)
      
      let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
      UIGraphicsEndImageContext()
      return image
   }
   
   func _formatButtons(squareSize: CGSize) {
      
      let distanceBetweenSquares = (view.frame.size.width/2.0) - (squareSize.width + view.frame.size.width/4.0)
      let margins = view.layoutMarginsGuide
      
      squareOne.translatesAutoresizingMaskIntoConstraints = false
      squareTwo.translatesAutoresizingMaskIntoConstraints = false
      squareThree.translatesAutoresizingMaskIntoConstraints = false
      squareFour.translatesAutoresizingMaskIntoConstraints = false
      
      squareOne.frame.size = squareSize
      squareTwo.frame.size = squareSize
      squareThree.frame.size = squareSize
      squareFour.frame.size = squareSize
      
      squareOne.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: view.frame.width/4.0).isActive = true
      squareOne.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -1.5*distanceBetweenSquares).isActive = true
      
      squareTwo.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -view.frame.width/4.0).isActive = true
      squareTwo.centerYAnchor.constraint(equalTo: squareOne.centerYAnchor).isActive = true
      
      squareThree.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: view.frame.width/4.0).isActive = true
      squareThree.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 1.5*distanceBetweenSquares).isActive = true
      
      squareFour.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -view.frame.width/4.0).isActive = true
      squareFour.centerYAnchor.constraint(equalTo: squareThree.centerYAnchor).isActive = true
      
      squareOne.setBackgroundImage(self._imageWithColor(color: UIColor(red: 247.0/255.0, green: 172.0/255.0, blue: 207.0/255.0, alpha: 1.0), size: squareSize), for: UIControlState.normal)
      squareTwo.setBackgroundImage(self._imageWithColor(color: UIColor(red: 232.0/255.0, green: 240.0/255.0, blue: 1.0, alpha: 1.0), size: squareSize), for: UIControlState.normal)
      squareThree.setBackgroundImage(self._imageWithColor(color: UIColor(red: 104.0/255.0, green: 116.0/255.0, blue: 232.0/255.0, alpha: 1.0), size: squareSize), for: UIControlState.normal)
      squareFour.setBackgroundImage(self._imageWithColor(color: UIColor(red: 57.0/255.0, green: 39.0/255.0, blue: 89.0/255.0, alpha: 1.0), size: squareSize), for: UIControlState.normal)
      
      squareOne.layer.cornerRadius = 5
      squareOne.clipsToBounds = true
      squareTwo.layer.cornerRadius = 5
      squareTwo.clipsToBounds = true
      squareThree.layer.cornerRadius = 5
      squareThree.clipsToBounds = true
      squareFour.layer.cornerRadius = 5
      squareFour.clipsToBounds = true
   }
   
}
