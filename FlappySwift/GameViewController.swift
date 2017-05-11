//
//  GameViewController.swift
//  FlappySwift
//
//  Created by Chyi Yaqing on 8/5/2017.
//  Copyright © 2017 Chyi Yaqing. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    private let skView = SKView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skView.frame = view.bounds
        view.addSubview(skView)
        if let scene = GameScene.unarchiveFromFile(file: "GameScence") as? GameScene {
            scene.size = skView.frame.size
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
