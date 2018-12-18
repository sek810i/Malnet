//
//  MainViewController.swift
//  MalNet
//
//  Created by Oleg Bogdan on 17/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation

protocol IMainController{
    func loadData()
    func showData()
}

class MainController: IMainController {
    var view: IMainView?
    var model: IMainModel?
    
    func loadData() {
        
    }
    
    func showData() {
        
    }
}
