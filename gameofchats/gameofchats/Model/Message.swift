//
//  Message.swift
//  gameofchats
//
//  Created by kanziw on 30/12/2017.
//  Copyright © 2017 kanziw. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    @objc var fromId: String?
    @objc var text: String?
    @objc var timestamp: NSNumber?
    @objc var toId: String?
    
    @objc var imageUrl: String?
    @objc var imageWidth: NSNumber?
    @objc var imageHeight: NSNumber?
    
    func chatPartnerId() -> String? {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        
        fromId = dictionary["fromId"] as? String
        text = dictionary["text"] as? String
        toId = dictionary["toId"] as? String
        timestamp = dictionary["timestamp"] as? NSNumber
        
        imageUrl = dictionary["imageUrl"] as? String
        imageWidth = dictionary["imageWidth"] as? NSNumber
        imageHeight = dictionary["imageHeight"] as? NSNumber
    }
}
