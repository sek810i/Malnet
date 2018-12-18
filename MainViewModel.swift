//
//  MainViewModel.swift
//  MalNet
//
//  Created by Oleg Bogdan on 17/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation

protocol IMainModel: class {
    
}

class MainModel: IMainModel {
    var controller: IMainController?
    
    func loadData(){
        let param: Parameters = [:]
        
        
        
        let request: String = "https://nm.malnet.ru/?controller=api&action=getApiKey&Login=\()&Pass=\()&DeviceId=\((UIDevice.current.identifierForVendor?.uuidString)!)&Model=\(UIDevice.current.localizedModel)&Vendor=Apple"

        Alamofire.request(request, method: .post, parameters: param, encoding: JSONEncoding(), headers: nil).responseSwiftyJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["Success"].boolValue {
                    let tokens = Tokens()
                    let accessToken = Token(
                        token: json["Data"]["AccessToken"]["Token"].stringValue,
                        expiresIn: json["Data"]["AccessToken"]["ExpiresIn"].intValue)
                    let refreshToken = Token(
                        token: json["Data"]["RefreshToken"]["Token"].stringValue,
                        expiresIn: 0)
                    tokens.AccessToken = accessToken
                    tokens.RefreshToken = refreshToken
                    DispatchQueue.main.async {
                        let db = RealmConnect()
                        db.saveTokens(tokens: tokens)
                    }
                   // self.controller?.goToMainScreen()
                } else {
                    //self.controller?.showAlert(message: json["ErrorMessage"].stringValue)
                }
            case .failure(let error):
                //self.controller?.showAlert(message: error as! String)
            }
        }

    }
}
