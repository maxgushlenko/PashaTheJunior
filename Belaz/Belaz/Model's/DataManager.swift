//
//  DataManager.swift
//  Belaz
//
//  Created by Maksim Gushlenko on 5/1/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit
import RealmSwift

class DataManager: NSObject {
    
    var belazes: [Belaz] {
        get {
            let realm = try! Realm()
            
            return Array(realm.objects(Belaz.self))
        }
    }
    
    func add(belaz: Belaz) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(belaz)
        }
    }
    
    func delete(belaz: Belaz) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(belaz)
        }
    }
}
