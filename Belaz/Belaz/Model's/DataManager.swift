//
//  DataManager.swift
//  Belaz
//
//  Created by Maksim Gushlenko on 5/1/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit
import RealmSwift

enum RealmError: Error {
    case cantWriteObject
    
    var description: String {
        switch self {
        case .cantWriteObject:
            return "Image is to big"
        }
    }
}

class DataManager: NSObject {
    
    var belazes: [Belaz] {
        get {
            let realm = try! Realm()
            
            return Array(realm.objects(Belaz.self))
        }
    }
    
    func add(belaz: Belaz) throws {
        
        guard belaz.isImageDataAllowedRealm() else {
            throw RealmError.cantWriteObject
        }
        
        let realm = try! Realm()
        try realm.write({
            realm.add(belaz)
        })
    }
    
    func delete(belaz: Belaz) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(belaz)
        }
    }
}
