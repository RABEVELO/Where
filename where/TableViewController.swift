//
//  TableViewController.swift
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



class TableViewController: UITableViewController {
    
    var timeLineData: NSMutableArray = NSMutableArray ()
    
//    func loadData() {
//    timeLineData.removeAllObjects()
//        var findTimeLineData: PFQuery = PFQuery (className: "sweets")
//        findTimeLineData.findObjectsInBackgroundWithBlock {
//        (objects: [AnyObject]?, error:NSError?) ->Void in
//            
//            if (error != nil){
//                if let objects = objects as? [PFObject] {
//                    for object in objects {
//                    self.timeLineData.addObject(object)
//                    }
//                    
//                    let array: NSArray = self.timeLineData.reverseObjectEnumerator().allObjects
//                    self.timeLineData = array as NSMutableArray
//                    self.tableView.reloadData()
//                    
//                }
//                
//            }
//        }
//    }
    func loadData() {
        var query = PFQuery(className:"sweets")
       // query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved scores.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        println(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    
    }
    
    override func viewDidAppear(animated: Bool) {
        self.loadData()
        if (PFUser.currentUser() != nil) {
            let actionSheetController : UIAlertController = UIAlertController(title: "s'identifier/s'enregistrer", message: "veuillez-vous identifier", preferredStyle: UIAlertControllerStyle.Alert)
            actionSheetController.addTextFieldWithConfigurationHandler {
                textfield ->Void in
                textfield.placeholder = "veuillez-vous idenfifier"
            }
            actionSheetController.addTextFieldWithConfigurationHandler {
                textfield ->Void in
                textfield.placeholder = "votre mot de pass"
                textfield.secureTextEntry = true
            }
        actionSheetController.addAction(UIAlertAction(title: "Log in", style: UIAlertActionStyle.Default, handler:{
        alertAction in
            let textfields: NSArray = actionSheetController.textFields as NSArray!
            let usernameTextfield: UITextField = textfields.objectAtIndex(0) as UITextField
            let passwordTextfield: UITextField = textfields.objectAtIndex(1) as UITextField
            
            PFUser.logInWithUsernameInBackground(usernameTextfield.text, password: passwordTextfield.text) {
                (user: PFUser!, error: NSError!) ->Void in
                if((user) != nil) {
                println("Identification parfait")
                }
                else {
                println("Erreur d'identification")
                }
            }
        }))
        actionSheetController.addAction(UIAlertAction(title: "Sign up", style: UIAlertActionStyle.Default, handler:{
            alertAction in
            let textfields: NSArray = actionSheetController.textFields as NSArray!
            let usernameTextfield: UITextField = textfields.objectAtIndex(0) as UITextField
            let passwordTextfield: UITextField = textfields.objectAtIndex(1) as UITextField
            var sweeter: PFUser = PFUser ()
            sweeter.username = usernameTextfield.text
            sweeter.password = passwordTextfield.text
            sweeter.signUpInBackgroundWithBlock {
                (success:Bool!, error:NSError!) ->Void in
                if !(error != nil) {
                println("Enregistrement reussi")
                }else {
                println(error.userInfo)
                }
            }
            
        }))
            self.presentViewController(actionSheetController, animated: true, completion: nil)
        }
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeLineData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: tableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as tableViewCell
        let sweet:PFObject = self.timeLineData.objectAtIndex(indexPath.row) as PFObject
        
        cell.sweetTextView.text = sweet.objectForKey("content") as String
        
        
        return cell
        
    }
}
