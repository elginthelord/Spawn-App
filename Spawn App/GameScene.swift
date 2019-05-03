//
//  GameScene.swift
//  Spawn App
//
//  Created by LORD ELGIN RAGUERO on 4/25/19.
//  Copyright © 2019 CLC. All rights reserved.
//

import SpriteKit
import GameplayKit

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
      
        
        
       
        }
 
    
    func spawnEnemies() {
        
        var enemy1 = SKSpriteNode(imageNamed: "enemyImage") 
        var enemy2 = SKSpriteNode(imageNamed: "enemy2")
       var random = Int.random(in: 0...1)
       
        var enemies: [SKSpriteNode] = [enemy1, enemy2]
       
        enemy1.position = CGPoint(x: (self.size.width * 0.70) , y: (self.size.height * 0.70))
          enemy2.position = CGPoint(x: (self.size.width * 0.50) , y: (self.size.height * 0.50))
        
        enemy1.scale(to: CGSize(width: 50, height: 50))
        enemy2.scale(to: CGSize(width: 50, height: 50))
        
        enemy2.physicsBody?.affectedByGravity = false
        enemy1.physicsBody?.affectedByGravity = false
        
        addChild(enemies[random])
        
        
    }
 
    
    
    
   

    
    
    
}
