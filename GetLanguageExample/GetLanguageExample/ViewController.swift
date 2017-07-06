//
//  ViewController.swift
//  GetLanguageExample
//
//  Created by David on 2017. 7. 6..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        preferLabel.text = "Language: \(Locale.preferredLanguages[0]) Locale: \((Locale.current as NSLocale).object(forKey: .countryCode)!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var preferLabel: UILabel!
}
