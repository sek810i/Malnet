//
//  DataManager.swift
//  MalNet
//
//  Created by Oleg Bogdan on 17/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON



class DataManager: NSObject {
    
    static var db = RealmConnect()
    
    static func loadMainViewData(completion: @escaping ((ClientInfo) -> Void), failed: @escaping ((String) -> Void)) {

        guard let token = db.getToken(),
            let tokenString: String = token.AccessToken?.Token else {
            return
        }
        
        let url: String = "https://nm.malnet.ru/?controller=api&action=getClientInfo&AccessToken=\(tokenString)"
        
        Alamofire.request(url, method: .post, encoding: JSONEncoding()).responseSwiftyJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["Success"].boolValue {
                    let clientInfo = ClientInfo()
                    clientInfo.id = json["id"].intValue
                    clientInfo.KvartiraID = json["KvartiraID"].intValue
                    clientInfo.login = json["login"].stringValue
                    clientInfo.wi_fi_code = json["wi_fi_code"].stringValue
                    clientInfo.fio = json["fio"].stringValue
                    clientInfo.nik = json["nik"].stringValue
                    clientInfo.burn = json["burn"].intValue
                    clientInfo.p_seriya = json["p_seriya"].stringValue
                    clientInfo.p_nomer = json["p_nomer"].stringValue
                    clientInfo.p_kem = json["p_kem"].stringValue
                    clientInfo.p_kogda = json["p_kogda"].stringValue
                    clientInfo.p_dogovor = json["p_dogovor"].stringValue
                    clientInfo.p_dogovor2 = json["p_dogovor2"].stringValue
                    clientInfo.p_papka = json["p_papka"].stringValue
                    clientInfo.p_papka2 = json["p_papka2"].stringValue
                    clientInfo.email = json["email"].stringValue
                    clientInfo.advertiser = json["advertiser"].stringValue
                    clientInfo.turn_ip = json["turn_ip"].stringValue
                    clientInfo.turn_ip_time = json["turn_ip_time"].stringValue
                    clientInfo.credit_time = json["credit_time"].stringValue
                    clientInfo.change_tp_time = json["change_tp_time"].stringValue
                    clientInfo.promotion_id = json["promotion_id"].stringValue
                    clientInfo.nocredit = json["nocredit"].stringValue
                    clientInfo.loyalty_client = json["loyalty_client"].stringValue
                    clientInfo.is_blocked = json["is_blocked"].stringValue
                    clientInfo.is_del = json["is_del"].stringValue
                    clientInfo.acquaint = json["acquaint"].stringValue
                    clientInfo.time_acquaint = json["time_acquaint"].stringValue
                    clientInfo.password = json["password"].stringValue
                    clientInfo.group_id = json["group_id"].stringValue
                    clientInfo.utm_id = json["utm_id"].stringValue
                    clientInfo.tariff_group = json["tariff_group"].stringValue
                    clientInfo.utm_account = json["utm_account"].stringValue
                    clientInfo.iptvid = json["iptvid"].stringValue
                    clientInfo.unlimuntil = json["unlimuntil"].stringValue
                    clientInfo.block_tp = json["block_tp"].stringValue
                    clientInfo.jur_name = json["jur_name"].stringValue
                    clientInfo.inn = json["inn"].stringValue
                    clientInfo.pwd = json["pwd"].stringValue
                    clientInfo.juridic = json["juridic"].stringValue
                    clientInfo.cable_tv = json["cable_tv"].stringValue
                    clientInfo.unsubscribe_reason = json["unsubscribe_reason"].stringValue
                    clientInfo.delay_payment_reason = json["delay_payment_reason"].stringValue
                    clientInfo.last_lk_action_time = json["last_lk_action_time"].stringValue
                    clientInfo.is_active = json["is_active"].stringValue
                    clientInfo.CTVOrderAvalaibality = json["CTVOrderAvalaibality"].stringValue
                    clientInfo.address = Address(rn: json["rn"].stringValue,
                                                 nn: json["nn"].stringValue,
                                                 un: json["un"].stringValue,
                                                 dn: json["dn"].stringValue,
                                                 chast: json["chast"].stringValue,
                                                 dn2: json["dn2"].stringValue,
                                                 cable_tv: json["cable_tv"].stringValue,
                                                 spec_tp: json["spec_tp"].stringValue,
                                                 gb: json["gb"].stringValue,
                                                 id: json["id"].stringValue,
                                                 p: json["p"].stringValue,
                                                 e: json["e"].stringValue,
                                                 kn: json["kn"].stringValue,
                                                 rid: json["rid"].stringValue,
                                                 nid: json["nid"].stringValue,
                                                 uid: json["uid"].stringValue,
                                                 did: json["did"].stringValue,
                                                 kid: json["kid"].stringValue,
                                                 subnet: json["subnet"].stringValue,
                                                 address_string: json["address_string"].stringValue,
                                                 tip: json["tip"].stringValue)
//                    clientInfo.utm = UTM(mob_phone: json["mob_phone"].stringValue,
//                                         is_blocked: json["is_blocked"].stringValue,
//                                         unlimited: json["unlimited"].stringValue,
//                                         balance: json["balance"].stringValue,
//                                         credit: json["credit"].stringValue,
//                                         status: json["status"].stringValue,
//                                         account_id: json["account_id"].stringValue,
//                                         id: json["id"].stringValue,
//                                         credit_time: json["credit_time"].stringValue,
//                                         password: json["password"].stringValue,
//                                         tariff: json["password"].arrayValue.map({ (item) -> Tariff in
//                                            return Tariff(dp: item["dp"].stringValue,
//                                                          name: item["name"].stringValue,
//                                                          next_id: item["next_id"].stringValue,
//                                                          id: item["id"].stringValue,
//                                                          link_id: item["link_id"].stringValue,
//                                                          cost: item["cost"].stringValue,
//                                                          ipAddresses: item["ipAddresses"].arrayValue.map({ (addres) -> IPAddresses in
//                                                            return IPAddresses(ping: addres["ping"].stringValue,
//                                                                               gepon: addres["gepon"].stringValue,
//                                                                               activ: addres["activ"].stringValue,
//                                                                               ip: addres["ip"].stringValue,
//                                                                               slink_id: addres["slink_id"].stringValue,
//                                                                               mask: addres["mask"].stringValue)
//                                                          })
//                                            )
//                                         }) ,
//                                         additionalParams: nil,
//                                         lastPayment: nil)
                    print(clientInfo)




//                    DispatchQueue.main.async {
//                        let db = RealmConnect()
//                        db.saveTokens(tokens: tokens)
//                    }
//                    completion()
                    //self.controller?.goToMainScreen()
                } else {
                    failed(json["ErrorMessage"].stringValue)
                    //self.controller?.showAlert(message: json["ErrorMessage"].stringValue)
                }
            case .failure(let error):
                failed(error.localizedDescription)
                //self.controller?.showAlert(message: error as! String)
            }
        }
    }
    
}
