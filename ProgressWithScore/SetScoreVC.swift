//
//  SetScoreVC.swift
//  ProgressWithScore
//
//  Created by Rahul Gupta on 6/15/17.
//  Copyright © 2017 Rahul Gupta. All rights reserved.
//

import UIKit

protocol sendBackValue {
    func sendValue(value:Int)
}

class SetScoreVC: UIViewController {
    
    
    @IBOutlet weak var lblShowScore: UILabel!
    var mScore : Int = 0
    var delegate : sendBackValue!

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelScore()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        mScore = 0
    }
    
    
    @IBAction func pressedGoBack(_ sender: Any) {
        
        //self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func pressedPlus(_ sender: Any) {
        
        if mScore < 10{
           mScore = mScore + 1
        }
        setLabelScore()
    }
    
    @IBAction func pressedMinus(_ sender: Any) {
        
        if mScore > 0{
            mScore = mScore - 1
        }
        setLabelScore()
    }
    
    func setLabelScore(){
    
        
        lblShowScore.text = String(mScore)
        //self.delegate.sendValue(value: mScore)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.delegate.sendValue(value: mScore)
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
