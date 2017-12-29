//
//  NewMessageController.swift
//  gameofchats
//
//  Created by David on 2017. 12. 29..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {
    
    let cellId = "cellId"
    var users = [AUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancle))
        
        fetchUser()
    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = AUser()
                
                // if you use this setter, your app will crash if your class properties don't exactly match up with the firebase dictionary key
                user.setValuesForKeys(dictionary)
                self.users.append(user)
            }
        }, withCancel: nil)
    }
    
    @objc func handleCancle() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let use a hack for new, we actually need to dequeue our cells for memory efficiency
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = "Dummy TEXT LALALLA"
        
        return cell
    }
}
