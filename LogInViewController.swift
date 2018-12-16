//
//  LogInViewController.swift
//  MalNet
//
//  Created by Oleg Bogdan on 16/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation

protocol ILogInViewController: class {
    func sendLogin(login: String, password: String)
    
}

class LogInViewController: ILogInViewController {
    
    var view: ILogInView?
    var model: ILogInViewModel?
    
    func sendLogin(login: String, password: String) {
        model?.sendLogin(login: login, password: password)
    }
    
}
