//
//  Avtorization.swift
//  MalNet
//
//  Created by Богдан Олег on 24.04.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import Foundation
import RealmSwift

class Avtorization {
    let realm = try! Realm()
    
    func loadUser() -> UserName {
        let firstUser = RealmUserName()
        try! self.realm.write {
            self.realm.add(firstUser, update: true)
        }
        let realmUser = self.realm.objects(RealmUserName.self)
        let user = UserName(login: realmUser.last!.login, password: realmUser.last!.password)
        return user
    }
    func logout() {
        let realmUser = self.realm.objects(RealmUserName.self)
        try! self.realm.write {
            self.realm.delete(realmUser.last!)
        }
    }
    func userLogIn(user: UserName) {
        let newUser = RealmUserName()
        newUser.login = user.login
        newUser.password = user.password
        try! self.realm.write {
            self.realm.add(newUser, update: true)
        }
    }
    
}
