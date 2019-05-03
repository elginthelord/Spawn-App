//
//  GameScene.swift
//  Spawn App
//
//  Created by LORD ELGIN RAGUERO on 4/25/19.
//  Copyright © 2019 CLC. All rights reserved.
//

import SpriteKit
import GameplayKit
//
    struct PhysicsCategory{
        static let none: UInt32 = 0
        static let all: UInt32 = UInt32.max
        static let enemies: UInt32 = 2 // #1
        static let fireBall: UInt32 = 4 // #2
        static let player: UInt32 = 1
}
        class GameScene: SKScene, SKPhysicsContactDelegate {
   
    var player = SKSpriteNode(imageNamed: "hero1")
            
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        button()
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector.zero //set gravity of entire physics world to 0
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run(spawnEnemies), SKAction.wait(forDuration: 1.0)])))
        
       
        }
 
    
    func spawnEnemies() {
        
        var enemy1 = SKSpriteNode(imageNamed: "enemyImage") 
        var enemy2 = SKSpriteNode(imageNamed: "testenemy")
       var random = Int.random(in: 0...1)
       
        var enemies: [SKSpriteNode] = [enemy1, enemy2]
       
        enemy1.position = CGPoint(x: (self.size.width * 0.50) , y: (self.size.height * 0.50))
          enemy2.position = CGPoint(x: (self.size.width * 0.50) , y: (self.size.height * 0.50))
        
        enemy1.scale(to: CGSize(width: 50, height: 50))
        enemy2.scale(to: CGSize(width: 50, height: 50))
        
        enemy2.physicsBody?.affectedByGravity = false
        enemy1.physicsBody?.affectedByGravity = false
        
        addChild(enemies[random])
        
        
    }
 
    
    func button(){
        var button = SKSpriteNode(imageNamed: "button")
        button.position = CGPoint(x: (self.size.width * 0.10), y: (self.size.height * 0.10))
        button.scale(to: CGSize(width: 50, height: 50))
        addChild(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* for touch in touches{
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            
            if touchedNode.name == "button" {
                touchedNode.removeFromParent()
            }
        }
    
}*/
        let touch = touches.first
        let location = touch?.location(in: self)
        
    
}
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{ return}
        
    let touchLocation = touch.location(in: self)
    let fireBall = SKSpriteNode(imageNamed: "fireball")
    fireBall.position = player.position
    fireBall.physicsBody = SKPhysicsBody(rectangleOf: fireBall.size)
    fireBall.physicsBody?.mass = 1
    fireBall.physicsBody?.categoryBitMask = PhysicsCategory.fireBall
    fireBall.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
    fireBall.physicsBody?.collisionBitMask = PhysicsCategory.none
    fireBall.physicsBody?.isDynamic = true
    addChild(fireBall)
   /* let offset = touchLocation - fireBall.position
    let direction = offset.normalized()
    let shootAmount = direction * 1000
    let realDest = shootAmount + fireBall.position
    let actionMoved = SKAction.move(to: realDest, duration: TimeInterval(2.0))
    let actionMovedDone = SKAction.removeFromParent()
    fireBall.run(SKAction.sequence([actionMoved, actionMovedDone])) */
}
    
    
    


}
