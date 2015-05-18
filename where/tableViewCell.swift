//
//  tableViewCell.swift
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

class tableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel! = UILabel()

    @IBOutlet weak var timeLabel: UILabel! = UILabel()
    
    @IBOutlet weak var sweetTextView: UITextView!  = UITextView()
}
