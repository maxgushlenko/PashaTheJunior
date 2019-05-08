//
//  Belaz.swift
//  Belaz
//
//  Created by Maksim Gushlenko on 5/1/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

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

class Belaz: NSObject {
    
    var name = ""
//    var image: UIImage = UIImage()
    var imageName = ""
    var type: BelazType = .disielYamz
    var capacity: Int = 0
    var isChoose = false

    init(name: String, imageName: String, type: BelazType, capacity: Int, isChoose: Bool) {
        super.init()

        self.name = name
//        self.image = UIImage(named: image)!
        self.imageName = imageName
        self.type = type
        self.capacity = capacity
        self.isChoose = isChoose
    }
}

