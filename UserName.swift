//
//  UserName.swift
//  MalNet
//
//  Created by Богдан Олег on 24.04.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUserName: Object {
    @objc dynamic var login :String = ""
    @objc dynamic var password :String = ""
    
    override static func primaryKey() -> String?{
        return "login"
    }
}


class UserName {
    var login :String = ""
    var password :String = ""
    init() {
        self.login = ""
        self.password = ""
        
    }
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
