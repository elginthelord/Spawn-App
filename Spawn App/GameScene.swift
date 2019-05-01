//
//  GameScene.swift
//  Spawn App
//
//  Created by LORD ELGIN RAGUERO on 4/25/19.
//  Copyright © 2019 CLC. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
   
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        button()
        
        
       
        }
 
    
    func spawnEnemies() {
        
        var enemy1 = SKSpriteNode(imageNamed: "testenemy") 
        var enemy2 = SKSpriteNode(imageNamed: "testenemy2")
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
        var button = SKSpriteNode(imageNamed: "buttton")
        button.position = CGPoint(x: (self.size.width * 0.10), y: (self.size.height * 0.10))
        button.scale(to: CGSize(width: 50, height: 50))
        addChild(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = location.
        }
    
}

}
