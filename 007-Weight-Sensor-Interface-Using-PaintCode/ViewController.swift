//
//  ViewController.swift
//  007-Weight-Sensor-Interface-Using-PaintCode
//
//  Created by Audrey Li on 3/23/15.
//  Copyright (c) 2015 Shomigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var weightUnitLabel: UILabel!
    @IBOutlet weak var weightSensorView: WeightSensorView!
    
    var timer: NSTimer!
    
    let deltaWeight: CGFloat = 0.05
    let totalWeightRange: CGFloat = 90
    
    @IBAction func addItem(sender: UIButton) {
        timer.invalidate()
        weightSensorView.weightScale += 0.1
        weightNumberLabel.text = weightSensorView.weightScale > 1 ? "\(Int(totalWeightRange))" : "\(Int(weightSensorView.weightScale * 90))"
    }
    
    @IBAction func removeItem(sender: UIButton) {
        timer.invalidate()
        weightSensorView.weightScale = weightSensorView.weightScale - 0.2
        weightNumberLabel.text = weightSensorView.weightScale < 0 ? "0" : "\(Int(weightSensorView.weightScale * 90))"
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("showWeight"), userInfo: nil, repeats: true)

        
    }

    func showWeight(){
        if weightSensorView.weightScale > 1{
            timer.invalidate()
        }
        weightSensorView.weightScale += 0.04
        weightNumberLabel.text = self.weightSensorView.weightScale > 1 ? "\(Int(self.totalWeightRange))" : "\(Int(self.weightSensorView.weightScale * 90))"
    }
    



}

