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
    
    @IBAction func touchDigit(_ sender: UIButton) {
        display.text = display.text! + sender.currentTitle!
    }
}

