//
//  MainViewModel.swift
//  MalNet
//
//  Created by Oleg Bogdan on 17/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation

protocol IMainModel: class {
    func loadData()
}

class MainModel: IMainModel {
    var controller: IMainController?
    
    func loadData(){
        DataManager.loadMainViewData(completion: { (data) in
            self.controller?.showData(info: data)
        }) { (error) in
            print(error)
        }
    }
}
