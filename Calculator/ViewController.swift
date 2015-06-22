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
    
    var userInTheMiddleofTypingANumber = false
    var brain = CalculatorBrain()

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleofTypingANumber {
        display.text = display.text! + digit
        } else {
            display.text = digit
            userInTheMiddleofTypingANumber = true
        }
        
    }

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userInTheMiddleofTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter() {
        userInTheMiddleofTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        }  else {
            displayValue = 0
        }
   }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

