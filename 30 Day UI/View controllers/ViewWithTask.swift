//
//  ViewWithTask.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 19.04.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit

class ViewWithTask: UIViewController {
    @IBOutlet weak var iDidItLabel: UILabel!
    @IBOutlet weak var labelWithDay: UILabel!
    @IBOutlet weak var labelWithTask: UILabel!
    @IBOutlet weak var illustrationToTask: UIImageView!
    @IBOutlet weak var labelWithHint: UILabel!
    @IBOutlet weak var buttonWithComplete: UIButton!
    
    @IBAction func buttonaction(_ sender: UIButton) {
        
        if buttonWithComplete.image(for: .normal) == UIImage(named: "pressedButton"){
            buttonWithComplete.setImage(UIImage(named: "Button"), for: UIControlState.normal)
            UserDefaults.standard.set(false, forKey: "\(daysFromStart)")
            iDidItLabel.isHidden = false
            numberOfCompletedTask = UserDefaults.standard.integer(forKey: "doingTask")
            numberOfCompletedTask -= 1
            UserDefaults.standard.set(numberOfCompletedTask, forKey: "doingTask")

        } else {
            buttonWithComplete.setImage(UIImage(named: "pressedButton"), for: UIControlState.normal)
            UserDefaults.standard.set(true, forKey: "\(daysFromStart)")
            iDidItLabel.isHidden = true
            numberOfCompletedTask = UserDefaults.standard.integer(forKey: "doingTask")
            numberOfCompletedTask += 1
            UserDefaults.standard.set(numberOfCompletedTask, forKey: "doingTask")
            
            if numberOfCompletedTask == 10 {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "achievementVC10") as UIViewController
                self.present(vc, animated: true, completion: nil)
            }
            if numberOfCompletedTask == 20 {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "achievementVC20") as UIViewController
                self.present(vc, animated: true, completion: nil)
            }
            if numberOfCompletedTask == 30 {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "achievementVC") as UIViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    
    
    var daysFromStart = 0
    var textOfButtonWhenPressed = ""
    var texOfButtonWhenNormal = "I did it!"
    var numberOfCompletedTask = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        var firstDate = UserDefaults.standard.object(forKey: "MM") as! Date?
        if firstDate == nil {
            UserDefaults.standard.set(Date(), forKey: "MM")
            firstDate = UserDefaults.standard.object(forKey: "MM") as! Date?
        }

        let isDone = UserDefaults.standard.bool(forKey: "\(daysFromStart)")
        if isDone == true {
            buttonWithComplete.setImage(UIImage(named: "pressedButton"), for: UIControlState.normal)
            iDidItLabel.isHidden = true
        }
        else {
            UserDefaults.standard.set(false, forKey: "\(daysFromStart)")
            iDidItLabel.isHidden = false
        }
        let dayString = "Day " + String(daysFromStart)
        let dayImage = "Illustration\(daysFromStart)"
        
                
       
        
        
        
        switch daysFromStart {
        case 0:
            labelWithDay.text = "Day 1"
            labelWithHint.text = arrayWithText[0]
            labelWithTask.text = arrayWithTask[0]
            illustrationToTask.image = #imageLiteral(resourceName: "Illustration1")
        case 1 ... 30:
            labelWithDay.text = dayString
            labelWithHint.text = arrayWithText[daysFromStart - 1]
            labelWithTask.text = arrayWithTask[daysFromStart - 1]
            illustrationToTask.image = UIImage(named: dayImage)
        default:
            labelWithDay.text = "Day 1(nil)"
            labelWithHint.text = arrayWithText[1]
            labelWithTask.text = arrayWithTask[1]
            illustrationToTask.image = UIImage(named: "illustration1")

        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        (buttonWithComplete.subviews[0] as! UIImageView).contentMode = .scaleAspectFit
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let secondViewController = segue.destination as! CalendarViewController
        secondViewController.daysFromStart = daysFromStart
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
