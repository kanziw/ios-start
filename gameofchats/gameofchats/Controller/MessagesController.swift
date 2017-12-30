//
//  ViewController.swift
//  gameofchats
//
//  Created by David on 2017. 12. 29..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "new_message_icon"), style: .plain, target: self, action: #selector(handleNewMessage))
        
        checkIfUserIsLoggedIn()
    }
    
    @objc func handleNewMessage() {
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            fetchUserAndSetupNavBarTitle()
        }
    }
    
    func fetchUserAndSetupNavBarTitle() {
        guard let uid = Auth.auth().currentUser?.uid else {
            // for some reason uid = nil
            return
        }
        
        Database.database().reference().child("users").child(uid)
            .observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    let user = AUser()
                    user.setValuesForKeys(dictionary)
                    self.setupNavBarWithUser(user: user)
                }
            }, withCancel: nil)
    }
    
    func setupNavBarWithUser(user: AUser) {
        let titleView = UIView()
        
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        if let profileImageUrl = user.profileImageUrl {
            profileImageView.loadImageUsingCacheWithUrlString(urlString: profileImageUrl)
        }
        
        titleView.addSubview(profileImageView)
        
        // ios 9 constraint anchors
        // need x,y,width,height
        profileImageView.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let nameLaber = UILabel()
        nameLaber.text = user.name
        nameLaber.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(nameLaber)
        
        // need x,y,width,height anchor
        nameLaber.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        nameLaber.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        nameLaber.rightAnchor.constraint(equalTo: titleView.rightAnchor).isActive = true
        nameLaber.heightAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print("", logoutError)
        }
        
        let loginController = LoginController()
        loginController.messagesController = self
        present(loginController, animated: true, completion: nil)
    }
}

