//
//  ViewWithTask.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 19.04.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit

class ViewWithTask: UIViewController {
    @IBOutlet weak var labelWithDay: UILabel!
    @IBOutlet weak var labelWithTask: UILabel!
    @IBOutlet weak var illustrationToTask: UIImageView!
    @IBOutlet weak var labelWithHint: UILabel!
    @IBOutlet weak var buttonWithComplete: UIButton!
    @IBOutlet weak var iDidItLabel: UILabel!
    
    @IBAction func buttonaction(_ sender: UIButton) {
        if buttonWithComplete.image(for: .normal) == UIImage(named: "pressedButton"){
    buttonWithComplete.setImage(UIImage(named: "Button"), for: UIControlState.normal)
    iDidItLabel.text = "I did it!"
    UserDefaults.standard.set(false, forKey: "\(daysFromStart)")
        } else {
            buttonWithComplete.setImage(UIImage(named: "pressedButton"), for: UIControlState.normal)
            iDidItLabel.text = ""
            UserDefaults.standard.set(true, forKey: "\(daysFromStart)")
        }
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
        
        let arrayWithText = ["Hint: Design a user profile and be mindful of the most important data, names, imagery, placement, etc. Is it for a serious profile? A social profile?", "Hint: Design a 404 page. Does it suit the brand's style? Is it user-friendly?", "Hint: Design a music player. Consider the controls, placements, imagery such as the artist or album cover, etc.", "Hint: Design a calculator. Standard, scientific, or speciality calculator for something such as a mortgage?", "Hint: Design a map. What type of features should it have? Should its color scheme compliment the brand the map is designed for?", "Hint: Design a checklist or to-do list of things you want to accomplish or don’t want to forget.", "Hint: Design a graph or visual to convey complex statistics.", "Hint: Design a Calendar focused element. Is it for scheduling an appointment? A reservation, flight, hotel, or concert calendar? Is it a calendar reminder feature? For email or something else entirely?", "Hint: Design something related to weather. It could be a UI for a mobile app a web app, or something completely different such as a weather alert widget. ", "Hint: Design a loader, spinner or animation to display activity. Consider if you know the time to complete the task or if it is unknown.", "Hint: Design an Email Receipt. What was purchased? On what date? Consider other elements such as a customer support info, a tracking number, pictures, related items, etc.", "Hint: Design a simple interaction to save or favourite something of interest.", "Hint: Design an interface for people to track and monitor their workouts.", "Hint: Design a minimal video player. Don’t forget to include things like volume, closed captions, quality, etc.", "Hint: esign an interface or app that allows travellers to search for the cheapest flights on the web.", "Hint: Design a button for a form, a game, a banking transaction or something else.", "Hint: Design a set of common icons for a wide range of applications.", "Hint: Design a dashboard. Is it to be used for web or app analytics, a health monitor, e-commerce analytics?", "Hint:Design something search related. It could be a search bar, an advanced search window, a search function, etc. ", "Hint: Design a recipe for food or drink or instructions to assemble some kind of object. ", "Hint: Design the header navigation for a website. Is it a sidebar, carousel or something else?", "Hint: Design a credit card checkout form or page. Don’t forget the important elements such as the numbers, dates, security numbers, etc", "Hint: Design settings for something. Is it for security or privacy settings? Game settings? What is it and what’s important?", "Hint: Breadcrumbs are quite necessary yet often neglected in terms of appearance and functionality.", "Hint: Design an interface to book a hotel room. Style, colors...it’s on you!", "Hint: Design a simple pagination to move between long lists of data. Don’t forget to show the amount of records :)", "Hint: Design a Contact Us page or form. Is it for customer support? A purchase inquiry? To schedule an appointment? Think about a scenario and the most important feature it would require.", "Hint: Design a Pop-Up/Overlay. Is it a web sign-up form that pops up? Is it an ad overlay?", "Hint: Design an interactive menu for an online store or restaurant.", "Hint: Design a widget that allows you to create notes, capture ideas and improve your productivity."]
        
        let arrayWithTask = ["User Profile", "404 Page", "Music Player", "Calculator", "Map", "ToDo List", "Statistics", "Calendar", "Weather", "Loading", "Email Receipt", "Favorites", "Workout Tracker", "Video Player", "Flight Search", "Button", "Icon Set", "Monitoring Dashboard", "Search", "Recipe", "Header Navigation", "Checkout", "Settings", "Breadcrumbs", "Hotel Booking", "Pagination", "Contact Us", "Pop-Up / Overlay", "Food/Drink Menu", "Notes Widget"]
        
        switch daysFromStart {
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
