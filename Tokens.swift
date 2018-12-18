//
//  Tokens.swift
//  MalNet
//
//  Created by Oleg Bogdan on 16/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation
import RealmSwift

class Token: Object {
    @objc dynamic var Token: String = ""
    @objc dynamic var ExpiresIn: Int = 0
    
    convenience init(token: String, expiresIn: Int) {
        self.init()
        self.Token = token
        self.ExpiresIn = expiresIn
    }
}

class Tokens: Object {
    @objc dynamic var AccessToken: Token?
    @objc dynamic var RefreshToken: Token?
}

extension RealmConnect {
    
    func saveTokens(tokens: Tokens) {
        try! self.realm.write {
            self.realm.add(tokens, update: false)
        }
    }
    
    func getToken() -> Tokens? {
        let tokens = self.realm.objects(Tokens.self)
        guard let lastTokens = tokens.last,
            let intTime: Int = lastTokens.AccessToken?.ExpiresIn
        
            else {return nil}
        let deadTime = Date(timeIntervalSince1970: TimeInterval(exactly: intTime)!)
        if Date() < deadTime {
            return lastTokens
        } else {
            return nil
        }
    }
}
