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
    let line = UIView()
    let line2 = UIView()
    
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
        
        line.height = 100*sqrt(2)
        line.width = 1
        line.layer.backgroundColor = UIColor.redColor().CGColor
        line.center = view1.center
        line.bottom = view1.top
        line.setAnchorPoint(CGPoint(x: 0, y: 1))
        line.layer.transform = CATransform3DMakeRotation(45.radian, 1, 0, 0)
        
        line2.height = 100*sqrt(2)
        line2.width = 1
        line2.layer.backgroundColor = UIColor.redColor().CGColor
        line2.center = view2.center
        line2.bottom = view2.top
        line2.setAnchorPoint(CGPoint(x: 0, y: 1))
        line2.layer.transform = CATransform3DMakeRotation(-45.radian, -1, 0, 0)
        
        
        view.addSubview(view1)
        view.addSubview(view2)
        view1.layer.doubleSided = true
        view2.layer.doubleSided = true
        line.layer.doubleSided = true
        line.layer.doubleSided = true
        
        transformLayer.addSublayer(view1.layer)
        transformLayer.addSublayer(view2.layer)
        transformLayer.addSublayer(line.layer)
        transformLayer.addSublayer(line2.layer)

        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0/500
        view.layer.sublayerTransform = perspective
        transformLayer.sublayerTransform = perspective
        
        
        NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: Selector("animate"), userInfo: nil, repeats: true).fire()
    }
    
    var angle:CGFloat = 0
    func animate() {
        
        angle = angle + 0.04
        let move = CATransform3DMakeTranslation(-100, 0, 0)
        let back = CATransform3DMakeTranslation(100, 0, 0)
        let rotate = CATransform3DMakeRotation(angle, 0, 1, 0)
        let rotateself = CATransform3DMakeRotation(-angle, 0, 1, 0)
        
        let transform = CATransform3DConcat(CATransform3DConcat(CATransform3DConcat(move, rotate), back),rotateself)
        view1.layer.transform = transform
        line.layer.transform = CATransform3DConcat(CATransform3DMakeRotation(45.radian, 1, 0, 0), transform)
        
        let transform2 = CATransform3DConcat(CATransform3DConcat(CATransform3DConcat(back, rotate), move),rotateself)
        view2.layer.transform = transform2
        line2.layer.transform = CATransform3DConcat(CATransform3DMakeRotation(-45.radian, -1, 0, 0), transform2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

