//
//  BelazRealm.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/15/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import Foundation
import RealmSwift

class BelazRealm: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var image: UIImage = UIImage()
    @objc dynamic var type = ""
    @objc dynamic var capacity = ""
    
//    init(name: String, imageName: String, type: String, capacity: String) {
//        super.init()
//
//        self.name = name
//        self.image = UIImage(named: imageName)!
//        self.type = type
//        self.capacity = capacity
//    }
}
