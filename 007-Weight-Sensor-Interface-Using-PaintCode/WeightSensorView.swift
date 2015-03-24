//
//  WeightSensorView.swift
//  007-Weight-Sensor-Interface-Using-PaintCode
//
//  Created by Audrey Li on 3/23/15.
//  Copyright (c) 2015 Shomigo. All rights reserved.
//

import UIKit

@IBDesignable
class WeightSensorView: UIView {

    var weightScale:CGFloat = 0.0{
        didSet {
            setNeedsDisplay()
        }
    }
    
 
    override func layoutSubviews() {
        backgroundColor = UIColor.clearColor()
       
    }
    override func drawRect(rect: CGRect) {
        if weightScale > 1{
            weightScale = 1.0
        } else if weightScale < 0 {
            weightScale = 0.0
        }
        StyleKit.drawWeightSensor(frame: bounds, weightScale: weightScale)
    }

}
