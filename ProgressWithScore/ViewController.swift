//
//  ViewController.swift
//  ProgressWithScore
//
//  Created by Rahul Gupta on 6/15/17.
//  Copyright © 2017 Rahul Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, sendBackValue {

    var scorLbl : UILabel!
    let shapeLayer = CAShapeLayer()
    var animcolor = CABasicAnimation()
    var mScore : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func sendValue(value: Int) {
        scorLbl.text = nil
        mScore = value
        setCircleProgress()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setCircleProgress()
        setScoreLbl()
    }
    
    func setScoreLbl(){
        
        let xOrigin = self.view.frame.size.width/2
        let yOrigin = self.view.frame.size.height/2.5
        
        scorLbl = UILabel(frame: CGRect(x:xOrigin - 100, y:yOrigin - 100, width:200, height:200))
        scorLbl.textColor = UIColor.white
        scorLbl.text = String(mScore)
        scorLbl.textAlignment = .center
        scorLbl.font = scorLbl.font.withSize(40)
        self.view.addSubview(scorLbl)
    }
    
    func setCircleProgress(){
        
        let xOrigin = self.view.frame.size.width/2
        let yOrigin = self.view.frame.size.height/2.5
        let endPoint = CGFloat(10) / CGFloat(mScore)
        
        shapeLayer.lineWidth = 5.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        
        shapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: xOrigin,y: yOrigin), radius: CGFloat(100), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2) / endPoint, clockwise: true).cgPath
        
        animcolor = CABasicAnimation(keyPath: "strokeEnd")
        animcolor.fromValue         = 0
        animcolor.toValue           = CGFloat(Double.pi * 2) / endPoint
        animcolor.duration          = 5.0;
        animcolor.repeatCount       = 0;
        animcolor.autoreverses      = false
        shapeLayer.add(animcolor, forKey: "animateCircle")
        
        self.view.layer.addSublayer(shapeLayer)
     
    }

    @IBAction func pressedSetTheScore(_ sender: Any) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SetScoreVC") as! SetScoreVC
        VC.delegate = self
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

