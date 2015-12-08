//
//  ViewController.swift
//  3D
//
//  Created by Mango on 15/12/7.
//  Copyright © 2015年 Mango. All rights reserved.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    
    let transformLayer = CATransformLayer()
    let view1 = UIView()
    let view2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transformLayer.frame = view.bounds
        view.layer.addSublayer(transformLayer)
        
        view1.height = 50
        view1.width = 50
        view1.center = self.view.center
        view1.centerX += 100
        view1.layer.backgroundColor = UIColor.redColor().CGColor
        
        view2.height = 50
        view2.width = 50
        view2.center = self.view.center
        view2.centerX -= 100
        view2.layer.backgroundColor = UIColor.redColor().CGColor
        
        view.addSubview(view1)
        view.addSubview(view2)
        view1.layer.doubleSided = true
        view2.layer.doubleSided = true
        
        transformLayer.addSublayer(view1.layer)
        transformLayer.addSublayer(view2.layer)

        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0/500
        transformLayer.transform = perspective
        
        NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: Selector("animate"), userInfo: nil, repeats: true).fire()
        
    }
    var angle:CGFloat = 0
    var line:THConnectLineView?
    
    func animate() {
        
        line?.layer.removeFromSuperlayer()
    
        angle = angle + 0.04
        let move = CATransform3DMakeTranslation(-100, 0, 0)
        let back = CATransform3DMakeTranslation(100, 0, 0)
        let rotate = CATransform3DMakeRotation(angle, 0, 1, 0)
        let rotateself = CATransform3DMakeRotation(-angle, 0, 1, 0)
        let transform = CATransform3DConcat(CATransform3DConcat(CATransform3DConcat(move, rotate), back),rotateself)
        view1.layer.transform = transform
        
        let transform2 = CATransform3DConcat(CATransform3DConcat(CATransform3DConcat(back, rotate), move),rotateself)
        view2.layer.transform = transform2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

