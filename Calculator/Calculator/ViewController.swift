//
//  ViewController.swift
//  Calculator
//
//  Created by David on 2017. 11. 1..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    @IBAction func touchDigit(_ sender: UIButton) {
        if (userIsInTheMiddleOfTyping) {
            display.text = display.text! + sender.currentTitle!
        } else {
            display.text = sender.currentTitle!
        }
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text = String(Double.pi)
            }
        }
    }
    
}

