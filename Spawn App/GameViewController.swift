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

class GameViewController: UIViewController, SKSceneDelegate {

    
    
    var ok = SKScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ok.delegate = self 
        
        //creating a gamescene the size as the same of the viewcontroller
        let scene = GameScene(size: view.bounds.size)
        
        //converting the viewcontroller into an SKview
        let SKView = self.view as! SKView
        
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .resizeFill
        
        // Present the scene
        SKView.presentScene(scene)
        
        
        SKView.ignoresSiblingOrder = true
        SKView.showsFPS = true
        SKView.showsNodeCount = true
        
    }
   
   
 
   
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
