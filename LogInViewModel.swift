//
//  LogInViewModel.swift
//  MalNet
//
//  Created by Oleg Bogdan on 16/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ILogInViewModel: class {
    func sendLogin(login: String, password: String)
}

class LogInViewModel: ILogInViewModel {
    
    var controller: ILogInViewController?
    
    func sendLogin(login: String, password: String) {
        let param: Parameters = [
            "controller": "api",
            "action": "getApiKey",
            "Login": login,
            "Pass": password,
            "DeviceId": UIDevice.current.identifierForVendor?.uuidString,
            "Model": UIDevice.current.model,
            "Vendor": "Apple",
        ]
        
        Alamofire.request("https://flu.nm.malnet.ru", method: .get, parameters: param, encoding: JSONEncoding(), headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(param)
                print(json.count)
            //self.file.flag = true as AnyObject?
            case .failure(let error):
                print(error)
            }
        }
    }
}
