

import SpriteKit
import GameplayKit


    struct PhysicsCategory{
        static let none: UInt32 = 0
        static let all: UInt32 = UInt32.max
        static let player: UInt32 = 1
        static let enemies: UInt32 = 2 // #1
        static let fireBall: UInt32 = 4 // #2
        static let base: UInt32 = 8
     
}
        class GameScene: SKScene, SKPhysicsContactDelegate {
    var currency: SKLabelNode!
    var player = SKSpriteNode(imageNamed: "hero1")
    
            var hero1Button: SKSpriteNode?
            var have = false
            var target = SKSpriteNode()
            var money: Int = 200
            var baseHealth: SKLabelNode!
            var health = 5
            
            
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        hero1Buttonz()
        baseBaseHealth()
      backgroundColor = UIColor.white
        homeBase()
        
        grass()
        
        spawnEnemies()
        
        yourMoney()
        
        
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run(spawnEnemies),SKAction.wait(forDuration: 2.0)])))
        
      
      
    
        }

            
            func yourMoney(){
               
               currency = SKLabelNode(fontNamed: "Times New Roman")
                currency.horizontalAlignmentMode = .right
                currency.verticalAlignmentMode = .center
                currency.zRotation = CGFloat.pi/2
                currency.text = "\(money)"
                currency.position = CGPoint(x: (self.size.width * 0.50), y: (self.size.height * 0.10))
                currency.fontColor = UIColor.black
                addChild(currency)
                
                
            }
            
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              
         
               
                for touch in touches {
                    
                    let location = touch.location(in: self)
                    money = Int(currency.text!)!
                    if (hero1Button?.contains(location))!{
                        hero1()
                     
                      
                        hero1Button?.color = UIColor.black
                        hero1Button?.colorBlendFactor = 0.2
                        currency.text = "\(money - 50)"
                        
                    }
                    
                }
            }
    
            func baseBaseHealth(){
                baseHealth = SKLabelNode(fontNamed: "Times New Roman")
                baseHealth.horizontalAlignmentMode = .right
                baseHealth.verticalAlignmentMode = .center
                baseHealth.zRotation = CGFloat.pi/2
                baseHealth.text = "\(health)"
                baseHealth.position = CGPoint(x: 135, y: 615)
                baseHealth.fontColor = UIColor.black
                addChild(baseHealth)
            }

            func hero1Buttonz(){
                hero1Button = SKSpriteNode(imageNamed: "hero1")
                hero1Button?.size = CGSize(width: 45, height: 45)
                hero1Button?.position = CGPoint(x: (self.size.width * 0.10), y: (self.size.height * 0.70))
                hero1Button?.zRotation = CGFloat.pi / 2
                hero1Button?.physicsBody?.categoryBitMask = PhysicsCategory.player
                hero1Button?.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
                hero1Button?.physicsBody?.collisionBitMask = PhysicsCategory.none
                
                addChild(hero1Button!)
            }
            
            
            func hero1(){
                var hero1 = SKSpriteNode(imageNamed: "hero1")
                
                
              
                hero1.scale(to: CGSize(width: 50, height: 50))
                
               
             
                
                hero1.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
               
                hero1.zRotation = CGFloat.pi / 2
                
                hero1.physicsBody?.categoryBitMask = PhysicsCategory.player
                hero1.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
                hero1.physicsBody?.collisionBitMask = PhysicsCategory.none
                
               var actionMove = SKAction.move(to: CGPoint(x:   hero1.position.x, y:  (hero1.position.y * -1)), duration: TimeInterval(CGFloat.random(in: 5...10)))
                let actionMoveDone = SKAction.removeFromParent()
                let wait10 = SKAction.wait(forDuration: 10)
                let wait5 = SKAction.wait(forDuration: 5)
               hero1.run(SKAction.sequence([actionMove, actionMoveDone]))
                addChild(hero1)
                
            }
            
            func hero2(){
                var hero2 = SKSpriteNode(imageNamed: "hero2")
                
         
                
                 hero2.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                
                hero2.scale(to: CGSize(width: 50, height: 50))
                
                  hero2.zRotation = CGFloat.pi / 2
                
                hero2.physicsBody?.categoryBitMask = PhysicsCategory.player
                hero2.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
                hero2.physicsBody?.collisionBitMask = PhysicsCategory.none
                var actionMove = SKAction.move(to: CGPoint(x:  hero2.position.x, y:  (hero2.position.y * -1)), duration: TimeInterval(CGFloat.random(in: 5...10)))
                let actionMoveDone = SKAction.removeFromParent()
                let wait10 = SKAction.wait(forDuration: 10)
                let wait5 = SKAction.wait(forDuration: 5)
                hero2.run(SKAction.sequence([actionMove, actionMoveDone]))
                addChild(hero2)
            }
            
            func hero3(){
                var hero3 = SKSpriteNode(imageNamed: "hero3")
                
             //   var xrandom = CGFloat.random(in: 0.60...0.80)
                
               // var xaxis = CGFloat(self.size.width * xrandom)
                
                hero3.position = CGPoint(x: (self.size.width * 0.60), y: (self.size.height * 0.90))
                
                 hero3.scale(to: CGSize(width: 50, height: 50))
                
                  hero3.zRotation = CGFloat.pi / 2
                
                hero3.physicsBody?.categoryBitMask = PhysicsCategory.player
                hero3.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
                hero3.physicsBody?.collisionBitMask = PhysicsCategory.none
                var actionMove = SKAction.move(to: CGPoint(x:   hero3.position.x, y:  (hero3.position.y * -1)), duration: TimeInterval(CGFloat.random(in: 5...10)))
                let actionMoveDone = SKAction.removeFromParent()
                let wait10 = SKAction.wait(forDuration: 10)
                let wait5 = SKAction.wait(forDuration: 5)
                hero3.run(SKAction.sequence([actionMove, actionMoveDone]))

                addChild(hero3)
            }
            
            
    
            
            
          
            func spawnEnemies() {
                
                var enemy1 = SKSpriteNode(imageNamed: "enemyImage")
                var enemy2 = SKSpriteNode(imageNamed: "enemy2")
                var random = Int.random(in: 0...1)
                
                var enemies: [SKSpriteNode] = [enemy1, enemy2]
                
            /*    var xrandom = CGFloat.random(in: 0.60...0.62)
                
               var xaxis = CGFloat(self.size.width * xrandom)
                */
                
                
                
                enemy1.physicsBody = SKPhysicsBody(rectangleOf: enemy1.size)
                enemy2.physicsBody = SKPhysicsBody(rectangleOf: enemy2.size)
                
                
                enemy1.position = CGPoint(x: (self.size.width * 0.60) , y: (self.size.height * 0.10))
                enemy2.position = CGPoint(x: (self.size.width * 0.60) , y: (self.size.height * 0.10))
                
                enemy1.scale(to: CGSize(width: 50, height: 50))
                enemy2.scale(to: CGSize(width: 50, height: 50))
                
                enemy1.physicsBody? = SKPhysicsBody(rectangleOf: enemy1.size)
                enemy2.physicsBody? = SKPhysicsBody(rectangleOf: enemy2.size)
                
                
                
                
                enemy1.physicsBody?.contactTestBitMask = PhysicsCategory.player
                enemy1.physicsBody?.categoryBitMask = PhysicsCategory.enemies
                enemy1.physicsBody?.contactTestBitMask = PhysicsCategory.fireBall
                enemy1.physicsBody?.contactTestBitMask = PhysicsCategory.base
                enemy1.physicsBody?.collisionBitMask = PhysicsCategory.none
                
                enemy2.physicsBody?.contactTestBitMask = PhysicsCategory.fireBall
                enemy2.physicsBody?.categoryBitMask = PhysicsCategory.enemies
                enemy2.physicsBody?.contactTestBitMask = PhysicsCategory.player
                enemy2.physicsBody?.contactTestBitMask = PhysicsCategory.base
                enemy2.physicsBody?.collisionBitMask = PhysicsCategory.none
                
                
                
                
                
                
                enemy2.physicsBody?.affectedByGravity = false
                enemy1.physicsBody?.affectedByGravity = false
                
                enemy1.zRotation = CGFloat.pi/2
                enemy2.zRotation = CGFloat.pi/2
                
                enemy1.physicsBody?.mass = 1
                enemy2.physicsBody?.mass = 1
               
            
                enemy1.physicsBody?.isDynamic = true
                enemy2.physicsBody?.isDynamic = true
                
                
                
                addChild(enemies[random])
                
                var actionMove = SKAction.move(to: CGPoint(x:  (self.size.width * 0.60), y:  (self.size.height)), duration: TimeInterval(CGFloat.random(in: 5...10)))
                var actionMove2 = SKAction.move(to: CGPoint(x:  (self.size.width * 0.60), y: (self.size.height)), duration: TimeInterval(CGFloat.random(in: 5...10)))
                let actionMoveDone = SKAction.removeFromParent()
                
                
                
                enemy1.run(SKAction.sequence([actionMove, actionMoveDone]))
                enemy2.run(SKAction.sequence([actionMove2, actionMoveDone]))
                
                
                
            }
            
            func homeBase(){
                let homebase = SKSpriteNode(imageNamed: "homeImage")
                homebase.position = CGPoint(x: 200, y: 620)
                
                homebase.physicsBody = SKPhysicsBody(rectangleOf: homebase.size)
                
                homebase.scale(to: CGSize(width: 120, height: 120))
                
                homebase.physicsBody?.mass = 1
                homebase.physicsBody?.collisionBitMask = PhysicsCategory.none
                homebase.physicsBody?.contactTestBitMask = PhysicsCategory.enemies
                homebase.physicsBody?.categoryBitMask = PhysicsCategory.base
                
                
                
                homebase.physicsBody?.isDynamic = true
                homebase.physicsBody?.affectedByGravity = false
                homebase.zRotation = CGFloat.pi/2
                addChild(homebase)
            }
            
            
            func grass(){
                var grassIsNice = SKSpriteNode(imageNamed: "grass")
                grassIsNice.scale(to: CGSize(width: 130 , height: 667))
                grassIsNice.position = CGPoint(x: self.size.width * 0.826, y: 333.5)
                grassIsNice.physicsBody?.categoryBitMask = PhysicsCategory.none
                grassIsNice.physicsBody?.contactTestBitMask = PhysicsCategory.none
                grassIsNice.physicsBody?.collisionBitMask = PhysicsCategory.none
                
                addChild(grassIsNice)
                
                
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
    
            
            func fireBallDidCollideWithEnemies(fireball: SKSpriteNode, enemies: SKSpriteNode){
                fireball.removeFromParent()
                enemies.removeFromParent()
                
            }
            
            
        
            func enemiesDidCollideWithBase(enemies: SKSpriteNode, base: SKSpriteNode){
              health = Int(baseHealth.text!)!
                
                
                
                health = health - 1
                
                
                 baseHealth.text = "\(health)"
             
                if (health - 1) >= 0 {
                    enemies.removeFromParent()
                } else if (health - 1) <= 0 {
                    enemies.removeFromParent()
                    base.removeFromParent()
                }
                
               

                
                
                
            }
     
            
            func didBegin(_ contact: SKPhysicsContact) {
                print("CONTACT")
                let one = contact.bodyA
                let two = contact.bodyB
                
                
                
                
                if let enemies = one.node as? SKSpriteNode, let base = two.node as? SKSpriteNode{
            
                    enemiesDidCollideWithBase(enemies: base, base: enemies)
                    
                }
                
                
               
            }
           
    
   /*
            func youCantBuy50(){
                if (money - 50) < 0{
                    let alert = UIAlertController(title: "You don't have any money!", message: nil, preferredStyle: .alert)
                    
                    let okay = UIAlertAction(title: "OKAY", style: .cancel)
                    
                    alert.addAction(okay)
                    
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            func youCantBuy75(){
                if (money - 75) < 0{
                    let alert = UIAlertController(title: "You don't have any money!", message: nil, preferredStyle: .alert)
                    
                    let okay = UIAlertAction(title: "OKAY", style: .cancel)
                    
                    alert.addAction(okay)
                    
                    
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
                
            }
            
            func youCantBuy100(){
                if (money - 100) < 0{
                    let alert = UIAlertController(title: "You don't have any money!", message: nil, preferredStyle: .alert)
                    
                    let okay = UIAlertAction(title: "OKAY", style: .cancel)
                    
                    alert.addAction(okay)
                    
                    
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
            

    
    */
    


}
