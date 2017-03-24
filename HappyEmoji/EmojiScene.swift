//
//  EmojiScene.swift
//  HappyEmoji
//
//  Created by Brendan Lau on 3/20/17.
//  Copyright © 2017 Brendan Lau. All rights reserved.
//

import SpriteKit

class EmojiScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.clear
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
    }
    
    public func sendFire(origin: CGPoint) { _shootEmoji(origin: origin, node: SKLabelNode(text: "🔥")) }
    
    public func sendShit(origin: CGPoint) { _shootEmoji(origin: origin, node: SKLabelNode(text: "💩")) }
    
    public func sendMerica(origin: CGPoint) { _shootEmoji(origin: origin, node: SKLabelNode(text: "❤️")) }
    
    public func sendKitty(origin: CGPoint) { _shootEmoji(origin: origin, node: SKLabelNode(text: "🐈")) }
    
    
    private func _shootEmoji(origin: CGPoint, node: SKLabelNode) {
        
        node.position = origin
        node.fontSize = 30
        
        node.physicsBody = SKPhysicsBody()
        
        if let physics = node.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.isDynamic = true
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        
        let finalY = random(min: origin.y + node.frame.height, max: size.height)
        let finalX = random(min: origin.x/2, max: origin.x + origin.x/2)
        
        let finalPoint = CGPoint(x: finalX, y: finalY)
        
        // Bezier Path for emojis.... FIX ME (later)
//        let pointOne = CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
//        let pointTwo = CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
//        let cgPath = CGMutablePath()
//        cgPath.move(to: origin)
//        cgPath.addCurve(to: finalPoint, control1: <#T##CGPoint#>, control2: <#T##CGPoint#>)
        
        
        addChild(node)
        
        let actionMove = SKAction.move(to: CGPoint(x: finalX, y: finalY), duration: TimeInterval(1.0))
        let actionMoveDone = SKAction.removeFromParent()
        let actionFadeOut = SKAction.fadeOut(withDuration: TimeInterval(0.5))
        
        node.run(SKAction.sequence([actionMove, actionFadeOut, actionMoveDone]))
    }
    
}
