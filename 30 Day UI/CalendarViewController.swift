//
//  CalendarViewController.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 29.04.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit


// Надо, что бы при нажатии на каждую из 30 кнопок, переходило на ViewWuthTask и меняло переменнкб daysFromStart на номер этой кнопки
class CalendarViewController: UIViewController {
    @IBAction func фсе(_ sender: UIButton) {
        self.performSegue(withIdentifier: "3", sender: self)
//        override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//            if segue.identifier == "push" {
//
//            }
//        }


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let secondViewController = segue.destination as! ViewWithTask
        secondViewController.daysFromStart = Int(segue.identifier!)!
    }
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var labelDay1: UILabel!
    @IBOutlet weak var labelDay2: UILabel!
    @IBOutlet weak var labelDay3: UILabel!
    @IBOutlet weak var labelDay4: UILabel!
    @IBOutlet weak var labelDay5: UILabel!
    @IBOutlet weak var labelDay6: UILabel!
    @IBOutlet weak var labelDay7: UILabel!
    @IBOutlet weak var labelDay8: UILabel!
    @IBOutlet weak var labelDay9: UILabel!
    @IBOutlet weak var labelDay10: UILabel!
    @IBOutlet weak var labelDay11: UILabel!
    @IBOutlet weak var labelDay12: UILabel!
    @IBOutlet weak var labelDay13: UILabel!
    @IBOutlet weak var labelDay14: UILabel!
    @IBOutlet weak var labelDay15: UILabel!
    @IBOutlet weak var labelDay16: UILabel!
    @IBOutlet weak var labelDay17: UILabel!
    @IBOutlet weak var labelDay18: UILabel!
    @IBOutlet weak var labelDay19: UILabel!
    @IBOutlet weak var labelDay20: UILabel!
    @IBOutlet weak var labelDay21: UILabel!
    @IBOutlet weak var labelDay22: UILabel!
    @IBOutlet weak var labelDay23: UILabel!
    @IBOutlet weak var labelDay24: UILabel!
    @IBOutlet weak var labelDay25: UILabel!
    @IBOutlet weak var labelDay26: UILabel!
    @IBOutlet weak var labelDay27: UILabel!
    @IBOutlet weak var labelDay28: UILabel!
    @IBOutlet weak var labelDay29: UILabel!
    @IBOutlet weak var labelDay30: UILabel!

    @IBOutlet weak var buttonDay1: UIButton!
    @IBOutlet weak var buttonDay2: UIButton!
    @IBOutlet weak var buttonDay3: UIButton!
    @IBOutlet weak var buttonDay4: UIButton!
    @IBOutlet weak var buttonDay5: UIButton!
    @IBOutlet weak var buttonDay6: UIButton!
    @IBOutlet weak var buttonDay7: UIButton!
    @IBOutlet weak var buttonDay8: UIButton!
    @IBOutlet weak var buttonDay9: UIButton!
    @IBOutlet weak var buttonDay10: UIButton!
    @IBOutlet weak var buttonDay11: UIButton!
    @IBOutlet weak var buttonDay12: UIButton!
    @IBOutlet weak var buttonDay13: UIButton!
    @IBOutlet weak var buttonDay14: UIButton!
    @IBOutlet weak var buttonDay15: UIButton!
    @IBOutlet weak var buttonDay16: UIButton!
    @IBOutlet weak var buttonDay17: UIButton!
    @IBOutlet weak var buttonDay18: UIButton!
    @IBOutlet weak var buttonDay19: UIButton!
    @IBOutlet weak var buttonDay20: UIButton!
    @IBOutlet weak var buttonDay21: UIButton!
    @IBOutlet weak var buttonDay22: UIButton!
    @IBOutlet weak var buttonDay23: UIButton!
    @IBOutlet weak var buttonDay24: UIButton!
    @IBOutlet weak var buttonDay25: UIButton!
    @IBOutlet weak var buttonDay26: UIButton!
    @IBOutlet weak var buttonDay27: UIButton!
    @IBOutlet weak var buttonDay28: UIButton!
    @IBOutlet weak var buttonDay29: UIButton!
    @IBOutlet weak var buttonDay30: UIButton!

    
    var daysFromStart = 0
    var buttons: [UIButton] = []
    var labels: [UILabel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [buttonDay1, buttonDay2, buttonDay3, buttonDay4, buttonDay5, buttonDay6, buttonDay7, buttonDay8, buttonDay9, buttonDay10, buttonDay11, buttonDay12, buttonDay13, buttonDay14, buttonDay15, buttonDay16, buttonDay17, buttonDay18, buttonDay19, buttonDay20, buttonDay21, buttonDay22, buttonDay23, buttonDay24, buttonDay25, buttonDay26, buttonDay27, buttonDay28, buttonDay29, buttonDay30]
        labels = [labelDay1, labelDay2, labelDay3, labelDay4, labelDay5, labelDay6, labelDay7, labelDay8, labelDay9, labelDay10, labelDay11, labelDay12, labelDay13, labelDay14, labelDay15, labelDay16, labelDay17, labelDay18, labelDay19, labelDay20, labelDay21, labelDay22, labelDay23, labelDay24, labelDay25, labelDay26, labelDay27, labelDay28, labelDay29, labelDay30]
        var i = 0
        while i < daysFromStart {
            i += 1
            let xxx = UserDefaults.standard.object(forKey: "\(i)")
            if xxx == nil {
                buttons[i - 1].setImage(#imageLiteral(resourceName: "undoingTask"), for: .normal)
                labels[i-1].alpha = 1
            }
            if xxx as? Bool == true {
                buttons[i - 1].setImage(#imageLiteral(resourceName: "doingTask"), for: .normal)
                labels[i-1].textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                labels[i-1].alpha = 1
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        let secondViewController = segue.destination as! ViewWithTask
//        secondViewController.daysFromStart = daysFromStart
//
//    }


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
