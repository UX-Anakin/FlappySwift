//
//  MenuViewController.swift
//  FlappySwift
//
//  Created by Chyi Yaqing on 8/5/2017.
//  Copyright © 2017 Chyi Yaqing. All rights reserved.
//

import UIKit
import HTPressableButton
import Cartography

// implements a nice menu to choose between the game and the Game Center
class MenuViewController: UIViewController {

    let playButton = HTPressableButton(frame: CGRect(x: 0,y: 0,width: 260,height: 50) , buttonStyle: .rect)
    let gameCenterButton = HTPressableButton(frame: CGRect(x: 0, y: 0, width: 260, height: 50), buttonStyle: .rect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layoutView()
        style()
        render()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension MenuViewController {

    // MARK: Setup
    func setup() {
        // Because we are setting the function to be called when the button is pressed using the addTarget() function, we must prefix the designed methods using @objc
        playButton?.addTarget(self, action: #selector(onplayPressed), for: .touchUpInside)
        view.addSubview(playButton!)
        gameCenterButton?.addTarget(self, action: #selector(onGameCenterPressed), for: .touchUpInside)
        view.addSubview(gameCenterButton!)
    }
    
    @objc func onplayPressed(sender: UIButton) {
        let vc = GameViewController()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
        print("onplayPressed")

    }
    
    @objc func onGameCenterPressed(sender: UIButton) {
        print("onGameCenterPressed")
    }
    
    //MARK: Layout
    func layoutView() {
        constrain(playButton!){
            view in
            view.bottom == view.superview!.centerY - 30
            view.centerX == view.superview!.centerX
            view.height == 80
            view.width == view.superview!.width - 40
        }
        
        constrain(gameCenterButton!){
            view in
            view.bottom == view.superview!.centerY + 110
            view.centerX == view.superview!.centerX
            view.height == 80
            view.width == view.superview!.width - 40
        }
    }
    
    //MARK: Style
    func style() {
        playButton?.buttonColor = UIColor.ht_grapeFruit()
        playButton?.shadowColor = UIColor.ht_grapeFruitDark()
        
        gameCenterButton?.buttonColor = UIColor.ht_aqua()
        gameCenterButton?.shadowColor = UIColor.ht_aquaDark()
    }
    
    //MARK: Render
    func render() {
        playButton?.setTitle("Play", for: .normal)
        gameCenterButton?.setTitle("Game Center", for: .normal)
    }
    
}
