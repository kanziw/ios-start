//
//  ChatLogController.swift
//  gameofchats
//
//  Created by kanziw on 30/12/2017.
//  Copyright © 2017 kanziw. All rights reserved.
//

import UIKit

class ChatLogController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Chat Log Controller"
        
        collectionView?.backgroundColor = .white
        
        setupInputComponents()
    }
    
    func setupInputComponents() {
        let containerView = UIView()
        containerView.backgroundColor = .red
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        // ios9 constraint anchors
        // x,y,w,h
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
