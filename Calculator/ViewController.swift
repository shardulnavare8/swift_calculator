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
        switch operation {
        case "×": performOperation { $1 * $0 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $1 + $0 }
        case "−": performOperation { $1 - $0 }
        default: break
        }
    }
    
    func performOperation(operation: (Double,Double) -> Double) {
        if (operandStack.count >= 2) {
            displayValue = operation (operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    

    
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userInTheMiddleofTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
        
        
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userInTheMiddleofTypingANumber = false
        }
    }
}

