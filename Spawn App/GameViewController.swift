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

    
    @IBOutlet var currency: UILabel!
    
    var money: Int = 100
    var gameScene:GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        hero1.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        hero2.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        hero3.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        currency.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        
        currency.text = "\(money + 100)"
        
        
        
        //hero4.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        
        
       
        
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
    
 
    @IBAction func hero1(_ sender: UIButton) {
        gameScene?.hero1()
        sender.isUserInteractionEnabled = false
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {_ in sender.isUserInteractionEnabled = true})
        money = Int(currency.text!)!
         if (money - 50) > 0{
        currency.text = "\(money - 50)"
         }
        youCantBuy()
        
        print("SPAWNED")
    }
    
    @IBAction func hero2(_ sender: UIButton) {
        gameScene?.hero2()
        sender.isUserInteractionEnabled = false
        Timer.scheduledTimer(withTimeInterval: 7, repeats: false, block: {_ in sender.isUserInteractionEnabled = true})
        money = Int(currency.text!)!
         if Int(currency.text!)! > 0{
        currency.text = "\(money - 75)"
        }
        youCantBuy()
        print("SPAWNED")
    }
    
    @IBAction func hero3(_ sender: UIButton) {
        gameScene?.hero3()
        sender.isUserInteractionEnabled = false
        Timer.scheduledTimer(withTimeInterval: 12, repeats: false, block: {_ in sender.isUserInteractionEnabled = true})
        money = Int(currency.text!)!
        if Int(currency.text!)! > 0{
        currency.text = "\(money - 100)"
        }
        youCantBuy()
        print("SPAWNED")
    }
    
    func youCantBuy(){
        if Int(currency.text!)! < 0{
            let alert = UIAlertController(title: "You don't have any money!", message: nil, preferredStyle: .alert)
            
            let okay = UIAlertAction(title: "OKAY", style: .cancel)
            
            alert.addAction(okay)
            
            
            
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    
    @IBOutlet var hero3: UIButton!
    @IBOutlet var hero4: UIButton!
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
