//
//  MainViewController2.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 28.04.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit

class MainViewController2: UIViewController {

    var daysFromStart = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let secondViewController = segue.destination as! ViewWithTask
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
