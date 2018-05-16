//
//  ViewController.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 15.04.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonWithOut: UIButton!
    @IBOutlet weak var labelWithDay: UILabel!
    
    var nowDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(
            nil, forKey: "modDaysFromStart")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"myId")
        self.present(viewController, animated: true, completion: nil)
        
        var firstDate = UserDefaults.standard.object(forKey: "MM") as! Date?
        
        if firstDate == nil {
            UserDefaults.standard.set(Date(), forKey: "MM")
            firstDate = UserDefaults.standard.object(forKey: "MM") as! Date?
        }
        
        let timeInterval = (firstDate?.timeIntervalSinceNow)!
        var days = -Int(timeInterval) / 60 / 60 / 24

        labelWithDay.text = "\(days)"
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let secondViewController = segue.destination as! MainViewController2
        secondViewController.daysFromStart = Int(labelWithDay.text!)! + 1
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

