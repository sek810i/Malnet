//
//  RealmConnect.swift
//  MalNet
//
//  Created by Oleg Bogdan on 16/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation
import RealmSwift

class RealmConnect {
    
    let realm = try! Realm(configuration: Realm.Configuration(schemaVersion: 2, migrationBlock: { (migration, oldSchemaVersion) in
        if (oldSchemaVersion < 1) {
            // Nothing to do!
            // Realm will automatically detect new properties and removed properties
            // And will update the schema on disk automatically
        }
    }))
    
    func saveClientInfo(info: ClientInfo) {
        try! self.realm.write {
            self.realm.add(info, update: true)
        }
    }
        
    func getClientInfo() -> ClientInfo? {
        return self.realm.objects(ClientInfo.self).last
    }
    
    
}
