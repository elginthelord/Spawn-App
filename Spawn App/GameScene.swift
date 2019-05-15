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
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run(spawnEnemies),SKAction.wait(forDuration: 2.0)])))
      homeBase()
      grass()
    
        }

 
    
            func hero1(){
                var hero1 = SKSpriteNode(imageNamed: "hero1")
                
                
                
               
                
               
              
                hero1.scale(to: CGSize(width: 50, height: 50))
                
               
             
                
                hero1.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
               
                hero1.zRotation = CGFloat.pi / 2
                
                
                addChild(hero1)
            }
            
            func hero2(){
                var hero2 = SKSpriteNode(imageNamed: "hero2")
                
                 hero2.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                
                hero2.scale(to: CGSize(width: 50, height: 50))
                
                  hero2.zRotation = CGFloat.pi / 2
                
                addChild(hero2)
            }
            
            func hero3(){
                var hero3 = SKSpriteNode(imageNamed: "hero3")
                
                hero3.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                
                 hero3.scale(to: CGSize(width: 50, height: 50))
                
                  hero3.zRotation = CGFloat.pi / 2
                
                addChild(hero3)
            }
            
            func hero4(){
                var hero4 = SKSpriteNode(imageNamed: "hero4")
                
                hero4.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                   hero4.scale(to: CGSize(width: 50, height: 50))
                
                  hero4.zRotation = CGFloat.pi / 2
                
                addChild(hero4)
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
               
                enemy1.physicsBody?.categoryBitMask = PhysicsCategory.enemies
                enemy2.physicsBody?.categoryBitMask = PhysicsCategory.enemies
                
                enemy1.physicsBody?.contactTestBitMask = PhysicsCategory.fireBall
                enemy2.physicsBody?.contactTestBitMask = PhysicsCategory.fireBall
                
                enemy1.physicsBody?.collisionBitMask = PhysicsCategory.none
                enemy2.physicsBody?.collisionBitMask = PhysicsCategory.none
                
                enemy1.physicsBody?.isDynamic = true
                enemy2.physicsBody?.isDynamic = true
                
                addChild(enemies[random])
                
                var actionMove = SKAction.move(to: CGPoint(x:  xaxis, y:  (self.size.height)), duration: TimeInterval(CGFloat.random(in: 5.0...10.0)))
                var actionMove2 = SKAction.move(to: CGPoint(x:  xaxis, y: (self.size.height)), duration: TimeInterval(CGFloat.random(in: 5.0...10.0)))
                let actionMoveDone = SKAction.removeFromParent()
                
                enemy1.run(SKAction.sequence([actionMove, actionMoveDone]))
                enemy2.run(SKAction.sequence([actionMove2, actionMoveDone]))
                
                
                
            }
            
            func homeBase(){
                let homebase = SKSpriteNode(imageNamed: "homeImage")
                homebase.position = CGPoint(x: 200, y: 620)
                homebase.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: homebase.size.width, height: homebase.size.height))
                homebase.scale(to: CGSize(width: 120, height: 120))
                homebase.physicsBody?.mass = 100000
                homebase.physicsBody?.collisionBitMask = PhysicsCategory.enemies
                homebase.physicsBody?.categoryBitMask = PhysicsCategory.none
                homebase.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
                homebase.physicsBody?.isDynamic = true
                homebase.physicsBody?.affectedByGravity = false
                homebase.zRotation = CGFloat.pi/2
                addChild(homebase)
            }
            
 
    
    
    

    
            override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
                guard let touch = touches.first else{return}
                let locationTouch = touch.location(in: self)
                let fireBall = SKSpriteNode(imageNamed: "fireBall")
                fireBall.position = player.position
                fireBall.physicsBody = SKPhysicsBody(rectangleOf: fireBall.size)
                fireBall.physicsBody?.mass = 1
                fireBall.physicsBody?.categoryBitMask = PhysicsCategory.fireBall
                fireBall.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
                fireBall.physicsBody?.collisionBitMask = PhysicsCategory.none
                fireBall.physicsBody?.isDynamic = true
                fireBall.scale(to: CGSize(width: 35, height: 35))
                fireBall.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                
                addChild(fireBall)
                let offset = locationTouch - fireBall.position
                let direction = offset.normalized()
                let shootAmount = direction * 1000
                let realDest = shootAmount + fireBall.position
                let actionMoved = SKAction.move(to: realDest, duration: TimeInterval(2.0))
                let actionMovedDone = SKAction.removeFromParent()
                fireBall.run(SKAction.sequence([actionMoved, actionMovedDone]))
            }
    
            func didBegin(_ contact: SKPhysicsContact) {
                print("Contact")
                let one = contact.bodyA.node as? SKSpriteNode
                let two = contact.bodyB.node as? SKSpriteNode
                one?.removeFromParent()
                two?.removeFromParent()
            }
    


    
    
    


}
