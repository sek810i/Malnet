//
//  Message.swift
//  MalNet
//
//  Created by Oleg Bogdan on 16.08.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import Foundation

class Messege {
    var senderType: String = ""
    var senderName: String = ""
    var text: String = ""
    
    init(sType: String, sName: String, text: String) {
        self.senderType = sType
        self.senderName = sName
        self.text = text
    }
    init(test:Int) {
        switch test {
        case 1:
            self.senderType = "Malnet"
            self.senderName = "Malnet"
            self.text = "Сообщение от малнета:\n бла бла бла бла бла бла бла бла бла"
        default:
            self.senderType = "User"
            self.senderName = "User"
            self.text = "Сообщение от пользователя"
        }

    }
    
}
