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

    
    
    var gameScene:GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        
        //creating a gamescene the size as the same of the viewcontroller
        
        
        
        
        //creating a gamescene the size as the same of the viewcontroller
        let scene = GameScene(size: view.bounds.size)
        
        gameScene = scene as! GameScene
        
        //converting the viewcontroller into an SKview
        let SKView = self.view as! SKView
        
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .resizeFill
        
        // Present the scene
        SKView.presentScene(scene)
        
        
        SKView.ignoresSiblingOrder = true
        SKView.showsFPS = true
        SKView.showsNodeCount = true
        
        
        //converting the viewcontroller into an SKview
       // let SKView = self.view as! SKView
      /*
        if let view = self.view as! SKView? {
            guard let scene = SKScene(fileNamed: "GameScene") else {
                return
            }
             scene.scaleMode = .resizeFill
            
            gameScene = scene as! GameScene
            
            
            
            view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
        }*/
    /*    SKView.presentScene(scene)
        
        
        SKView.ignoresSiblingOrder = true
        SKView.showsFPS = true
        SKView.showsNodeCount = true
        */
        // Set the scale mode to scale to fit the window
       
        
        // Present the scene
        
        
    }
   
 /*   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: gameScene!)
        
        let node : SKNode = gameScene!.atPoint(location!)
    }*/
 
    @IBAction func spawButton(_ sender: UIButton) {
        gameScene?.spawnHero()
        
        
        print("SPAWNED")
    }
    
    
    
    
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
