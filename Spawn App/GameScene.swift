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
     grass()
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run(spawnEnemies),SKAction.wait(forDuration: 2.0)]
        )))
        }
 
    
            func spawnHero(){
                var hero1 = SKSpriteNode(imageNamed: "hero1")
                var hero2 = SKSpriteNode(imageNamed: "hero2")
                var hero3 = SKSpriteNode(imageNamed: "hero3")
                var hero4 = SKSpriteNode(imageNamed: "hero4")
                
                var heroes: [SKSpriteNode] = [hero1, hero2, hero3, hero4]
                
                var random = Int.random(in: 0...3)
              
                hero1.scale(to: CGSize(width: 50, height: 50))
                hero2.scale(to: CGSize(width: 50, height: 50))
                hero3.scale(to: CGSize(width: 50, height: 50))
                hero4.scale(to: CGSize(width: 50, height: 50))
                
                hero1.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                hero2.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                 hero3.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                 hero4.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                
                hero1.zRotation = CGFloat.pi/2
                addChild(heroes[random])
            }
            
           func grass(){
                var grassIsNice = SKSpriteNode(imageNamed: "grass")
                grassIsNice.scale(to: CGSize(width: 130 , height: 667))
                grassIsNice.position = CGPoint(x: self.size.width * 0.826, y: 333.5)
                addChild(grassIsNice)
                
            }
            func spawnEnemies() {
                
                var enemy1 = SKSpriteNode(imageNamed: "enemyImage")
                var enemy2 = SKSpriteNode(imageNamed: "enemy2")
                var random = Int.random(in: 0...1)
                
                var enemies: [SKSpriteNode] = [enemy1, enemy2]
                var xrandom = CGFloat.random(in: 0.60...0.80)
                
                var xaxis = CGFloat(self.size.width * xrandom)
                
                
                
                enemy1.position = CGPoint(x: xaxis , y: (self.size.height * 0.10))
                enemy2.position = CGPoint(x: xaxis , y: (self.size.height * 0.10))
                
                enemy1.scale(to: CGSize(width: 50, height: 50))
                enemy2.scale(to: CGSize(width: 50, height: 50))
                
                enemy1.physicsBody? = SKPhysicsBody(rectangleOf: enemy1.size)
                enemy2.physicsBody? = SKPhysicsBody(rectangleOf: enemy2.size)
                
                enemy2.physicsBody?.affectedByGravity = false
                enemy1.physicsBody?.affectedByGravity = false
                
                enemy1.zRotation = CGFloat.pi/2
                enemy2.zRotation = CGFloat.pi/2
                
                enemy1.physicsBody?.mass = 1
                enemy2.physicsBody?.mass = 1
                
                enemy1.physicsBody?.isDynamic = true
                enemy2.physicsBody?.isDynamic = true
                
                addChild(enemies[random])
                
                var actionMove = SKAction.move(to: CGPoint(x:  xaxis, y:  (self.size.height)), duration: TimeInterval(CGFloat.random(in: 5.0...10.0)))
                var actionMove2 = SKAction.move(to: CGPoint(x:  xaxis, y: (self.size.height)), duration: TimeInterval(CGFloat.random(in: 5.0...10.0)))
                let actionMoveDone = SKAction.removeFromParent()
                
                enemy1.run(SKAction.sequence([actionMove, actionMoveDone]))
                enemy2.run(SKAction.sequence([actionMove2, actionMoveDone]))
                
                
                
            }
            
            func buttonRotation(){
                
            }
            
    func createHealthBar(){ //creates health bar for enemies and home base
        
        
            }
    
    
    
   

    
    
    
}

