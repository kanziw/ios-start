//
//  ViewController.swift
//  gameofchats
//
//  Created by David on 2017. 12. 29..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let ref = Database.database().reference(fromURL: "https://gameofchats-ddd9f.firebaseio.com/")
//        ref.updateChildValues(["somevalue": 123123])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}

