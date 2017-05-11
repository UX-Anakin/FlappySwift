//
//  extension.swift
//  FlappySwift
//
//  Created by Chyi Yaqing on 11/5/2017.
//  Copyright © 2017 Chyi Yaqing. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

// To read the scene from a file, we added a class convenience method to SKNode:
extension SKNode {
    
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = Bundle.main.path(forResource: file as String, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .mappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWith: sceneData as Data)
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}
