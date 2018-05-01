//
//  ViewWithTask.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 19.04.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit

class ViewWithTask: UIViewController {
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var labelWithDay: UILabel!
    @IBOutlet weak var labelWithTask: UILabel!
    @IBOutlet weak var illustrationToTask: UIImageView!
    @IBOutlet weak var labelWithHint: UILabel!
    @IBOutlet weak var buttonWithComplete: UIButton!
    @IBOutlet weak var iDidItLabel: UILabel!
    
    @IBAction func buttonaction(_ sender: UIButton) {
    buttonWithComplete.setImage(UIImage(named: "pressedButton"), for: UIControlState.normal)
    iDidItLabel.text = ""
    UserDefaults.standard.set(true, forKey: "\(daysFromStart)")
    }
    
    var daysFromStart = 0
    
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
        }
        let dayString = "Day " + String(daysFromStart)
        let dayImage = "Illustration\(daysFromStart)"
        
        let arrayWithText = ["Hint: Design a user profile and be mindful of the most important data, names, imagery, placement, etc. Is it for a serious profile? A social profile?", "Hint: Design a 404 page. Does it suit the brand's style? Is it user-friendly?", "Hint: Design a music player. Consider the controls, placements, imagery such as the artist or album cover, etc.", "Hint: Design a calculator. Standard, scientific, or speciality calculator for something such as a mortgage?", "Hint: Design a map. What type of features should it have? Should its color scheme compliment the brand the map is designed for?"]
        
        let arrayWithTask = ["User Profile", "404 Page", "Music Player", "Calculator", "Map"]
        
        switch daysFromStart {
        case 1:
            labelWithDay.text = dayString
            labelWithHint.text = arrayWithText[daysFromStart - 1]
            labelWithTask.text = arrayWithTask[daysFromStart - 1]
            illustrationToTask.image = UIImage(named: dayImage)
        case 2:
            labelWithDay.text = dayString
            labelWithHint.text = arrayWithText[daysFromStart - 1]
            labelWithTask.text = arrayWithTask[daysFromStart - 1]
            illustrationToTask.image = UIImage(named: dayImage)
        case 3:
            labelWithDay.text = dayString
            labelWithHint.text = arrayWithText[daysFromStart - 1]
            labelWithTask.text = arrayWithTask[daysFromStart - 1]
            illustrationToTask.image = UIImage(named: dayImage)
        case 4:
            labelWithDay.text = dayString
            labelWithHint.text = arrayWithText[daysFromStart - 1]
            labelWithTask.text = arrayWithTask[daysFromStart - 1]
            illustrationToTask.image = UIImage(named: dayImage)
        case 5:
            labelWithDay.text = dayString
            labelWithHint.text = arrayWithText[daysFromStart]
            labelWithTask.text = arrayWithTask[daysFromStart]
            illustrationToTask.image = UIImage(named: dayImage)
        default:
            labelWithDay.text = "124214"
        }
        
        // Do any additional setup after loading the view.
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
