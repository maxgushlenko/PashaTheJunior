//
//  BelazRealm.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/15/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import Foundation
import RealmSwift

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
    @objc dynamic var rating = Rating.notRated.rawValue
    
}

extension Belaz {
    
    func isImageDataAllowedRealm() -> Bool {
        
        let maxRealmImageDataBytes = 15 * 1024 * 1024
        
        guard
            let imageData = image.pngData(),
            imageData.count < maxRealmImageDataBytes else {
                return false
        }
        
        return true
    }
}
