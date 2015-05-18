//
//  ViewController.swift
//  where
//
//  Created by RABEVELO Christian on 07/05/2015.
//  Copyright (c) 2015 RABEVELO Christian. All rights reserved.
//
import Parse
import Bolts
import UIKit
import ParseUI
import ParseCrashReporting

class ViewController: UIViewController {

    @IBOutlet weak var viewControllerTextField: UITextView! = UITextView ()
    
    @IBOutlet weak var charRemainingLabel: UILabel! = UILabel ()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerTextField.layer.borderColor = UIColor.blackColor().CGColor
        viewControllerTextField.layer.borderWidth = 0.5
        viewControllerTextField.layer.cornerRadius = 5
        viewControllerTextField.becomeFirstResponder()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        let testObject = PFObject(className: "TableOne")
//        testObject["foo"] = "Marie"
//        testObject["bar"] = "Aurelie"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            println("Donnée très bien sauvegardé")
//        }
//    
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendButton(sender: AnyObject) {
        var sweet:PFObject = PFObject (className: "sweets")
        sweet["content"] = viewControllerTextField.text
        sweet["sweeter"] = PFUser.currentUser()
        
        sweet.saveInBackground()
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

}

