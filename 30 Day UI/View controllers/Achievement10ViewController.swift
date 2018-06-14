//
//  Achievement10ViewController.swift
//  30 Day UI
//
//  Created by Daniil Poplavski on 28.05.2018.
//  Copyright © 2018 Daniil Poplavski. All rights reserved.
//

import UIKit

class Achievement10ViewController: UIViewController {
    @IBOutlet weak var shareButtonOutlet: UIButton!
    
    @IBAction func shareButtonAction(_ sender: UIButton) {
        
        
        let itemsToShare: [Any] = [ textToShare, #imageLiteral(resourceName: "1024")]
        
        let vc = VisualActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        vc.previewNumberOfLines = 10
        presentActionSheet(vc, from: sender)

    }
    
    private func presentActionSheet(_ vc: VisualActivityViewController, from view: UIView) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            vc.popoverPresentationController?.sourceView = view
            vc.popoverPresentationController?.sourceRect = view.bounds
            vc.popoverPresentationController?.permittedArrowDirections = [.right, .left]
        }
        
        present(vc, animated: true, completion: nil)
    }

    let yourAttributes : [NSAttributedStringKey: Any] = [
        NSAttributedStringKey.foregroundColor : UIColor.black,
        NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributeString = NSMutableAttributedString(string: "Share with your friends!", attributes: yourAttributes)
        shareButtonOutlet.setAttributedTitle(attributeString, for: .normal)

        // Do any additional setup after loading the view.
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
