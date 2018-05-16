//
//  CalendarViewController.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 29.04.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
   
    @IBOutlet weak var label30Tasks: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var labelWithCompletedDay: UILabel!
    
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
    var modDaysFromStart = UserDefaults.standard.object(forKey: "modDaysFromStart")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if modDaysFromStart == nil {
            UserDefaults.standard.set(
            daysFromStart, forKey: "modDaysFromStart")
            modDaysFromStart = UserDefaults.standard.object(forKey: "modDaysFromStart")
        }
        
        buttons = [buttonDay1, buttonDay2, buttonDay3, buttonDay4, buttonDay5, buttonDay6, buttonDay7, buttonDay8, buttonDay9, buttonDay10, buttonDay11, buttonDay12, buttonDay13, buttonDay14, buttonDay15, buttonDay16, buttonDay17, buttonDay18, buttonDay19, buttonDay20, buttonDay21, buttonDay22, buttonDay23, buttonDay24, buttonDay25, buttonDay26, buttonDay27, buttonDay28, buttonDay29, buttonDay30]
        
        var i = 0
        var numberOfCompletedTask = 0
        while i < modDaysFromStart as! Int {
            i += 1
            let xxx = UserDefaults.standard.object(forKey: "\(i)")
            if xxx == nil {
                buttons[i - 1].setBackgroundImage(#imageLiteral(resourceName: "undoingTask"), for: .normal)
                buttons[i - 1].setTitleColor(#colorLiteral(red: 0.3490196078, green: 0.3529411765, blue: 0.4, alpha: 1), for: .normal)

            }
            if xxx as? Bool == true {
                buttons[i - 1].setBackgroundImage(#imageLiteral(resourceName: "doingTask"), for: .normal)
                buttons[i - 1].setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                numberOfCompletedTask += 1
                
            }
            if xxx as? Bool == false {
                buttons[i - 1].setBackgroundImage(UIImage(named: "undoingTask"), for: .normal)
                buttons[i - 1].setTitleColor(#colorLiteral(red: 0.3490196078, green: 0.3529411765, blue: 0.4, alpha: 1), for: .normal)
            }
        }
        labelWithCompletedDay.text = "\(numberOfCompletedTask)"
        if numberOfCompletedTask > 9 {
            label30Tasks.text = "           /30 tasks are completed!"
        }
        else {
            label30Tasks.text = "      /30 tasks are completed!"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let secondViewController = segue.destination as! ViewWithTask
        secondViewController.daysFromStart = Int(segue.identifier!)!
    }

    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let intIndex = Int(identifier)! - 1

        if buttons[intIndex].backgroundImage(for: .normal) != #imageLiteral(resourceName: "unavailableTask") {
            return true
        }
        
        else {
            return false
        }
        
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
