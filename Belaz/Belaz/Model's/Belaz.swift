//
//  BelazRealm.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/15/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import Foundation
import RealmSwift

enum BelazType: String {
    
    case disielYamz = "Disiel Yamz"
    case disielCummins = "Disiel Cummins"
    case disielMTU = "Disiel MTU"
    case siemiens = "Siemiens"
    case DC = "DC Belaz"
    case electrosila = "Electrosila"
    case robotTransmission = "Robot transmission"
    case generalElectric = "General electric"
}

class Belaz: Object {
    
    var image: UIImage {
        get {
            guard let data = self.imageData else { return UIImage() }
            return UIImage(data: data) ?? UIImage()
        }
    }
    
    @objc dynamic var name = ""
    @objc dynamic var imageData: Data?
    @objc dynamic var type = ""
    @objc dynamic var capacity = ""
    
}
