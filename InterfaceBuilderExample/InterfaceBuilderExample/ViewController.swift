//
//  ViewController.swift
//  InterfaceBuilderExample
//
//  Created by David on 2017. 6. 22..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func touchAction(_ sender: UIButton) {
        // 레이블의 텍스트를 변경하는 코드
        label.text = "Hellow Guys!"
    }
}

