//
//  GameViewController.swift
//  Spawn App
//
//  Created by LORD ELGIN RAGUERO on 4/25/19.
//  Copyright © 2019 CLC. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    

    
    var money: Int = 200
    var gameScene:GameScene?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        hero1.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        hero2.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        hero3.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        
        
       
        
        
        
        
        
        
       
        
        //creating a gamescene the size as the same of the viewcontroller
        
        
        
        
        //creating a gamescene the size as the same of the viewcontroller
        let scene = GameScene(size: view.bounds.size)
        var gameInfo: String?
        gameScene = scene as! GameScene
        
        //converting the viewcontroller into an SKview
        let SKView = self.view as! SKView
        
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .resizeFill
        
        
        // Present the scene
        scene.userData = NSMutableDictionary()
        scene.userData?.setObject(gameInfo ?? "", forKey: "gameInfo" as NSCopying)
        SKView.presentScene(scene)
        
        
        SKView.ignoresSiblingOrder = true
        SKView.showsFPS = true
        SKView.showsNodeCount = true
        
        
        
        
    }
   

 
    @IBAction func hero1(_ sender: UIButton) {
        
        
        
        //money = Int(currency.text!)!
        
        if (money - 50) >  0 {
            sender.isUserInteractionEnabled = false
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {_ in sender.isUserInteractionEnabled = true})
       //     currency.text = "\(money - 50)"
            gameScene?.hero1()
            
            
        } else if (money - 50) < 0 {
            sender.isUserInteractionEnabled = false
            //currency.text = "\(money)"
            
            
            
            
        }
        
       
        
        
        
        print("SPAWNED")
    }
    
    
    
    
    @IBAction func hero2(_ sender: UIButton) {
       
        
        
      //  money = Int(currency.text!)!
        
        if (money - 75) >  0 {
            sender.isUserInteractionEnabled = false
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {_ in sender.isUserInteractionEnabled = true})
          //  currency.text = "\(money - 75)"
            gameScene?.hero2()
            
            
        } else if (money - 75) < 0 {
            sender.isUserInteractionEnabled = false
     //       currency.text = "\(money)"
            
            
            
            
            
        }
        
        
        print("SPAWNED")
    }
    
    @IBAction func hero3(_ sender: UIButton) {
        
        
     //   money = Int(currency.text!)!
        
        if (money - 100) >  0 {
            sender.isUserInteractionEnabled = false
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {_ in sender.isUserInteractionEnabled = true})
          //  currency.text = "\(money - 100)"
            gameScene?.hero3()
            
            
        } else if (money - 100) < 0 {
            sender.isUserInteractionEnabled = false
         //   currency.text = "\(money)"
            
            
            
            
        }
        
        print("SPAWNED")
    }
    


    
    
    @IBOutlet var hero3: UIButton!
    @IBOutlet var hero1: UIButton!
    @IBOutlet var hero2: UIButton!
    
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParent) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
    }
 
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
