//
//  ViewController.swift
//  Calculator
//
//  Created by Shardul Navare on 3/2/15.
//  Copyright (c) 2015 Shardul Navare. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

   
    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleofTypingANumber: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleofTypingANumber {
        display.text = display.text! + digit
        } else {
            display.text = digit
            userInTheMiddleofTypingANumber = true
        }
        
    }
}

