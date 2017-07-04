//
//  ViewController.swift
//  Calculator
//
//  Created by パプリカ on 7/3/17.
//  Copyright © 2017 パプリカ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInMiddleOfTyping = true
        }
    }
    
    @IBOutlet weak var display: UILabel!  // implicit unwrapping
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
    
    var userIsInMiddleOfTyping = false

    // calculated property
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
}
