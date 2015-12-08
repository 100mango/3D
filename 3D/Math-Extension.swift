//
//  Math-Extension.swift
//  3D
//
//  Created by Mango on 15/12/7.
//  Copyright © 2015年 Mango. All rights reserved.
//

import UIKit

extension Int{
    var radian:CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}