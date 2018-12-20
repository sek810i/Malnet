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
import RealmSwift



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
                    clientInfo.id = json["Data"]["id"].intValue
                    clientInfo.KvartiraID = json["Data"]["KvartiraID"].stringValue
                    clientInfo.login = json["Data"]["login"].stringValue
                    clientInfo.wi_fi_code = json["Data"]["wi_fi_code"].stringValue
                    clientInfo.fio = json["Data"]["fio"].stringValue
                    clientInfo.nik = json["Data"]["nik"].stringValue
                    clientInfo.burn = json["Data"]["burn"].intValue
                    clientInfo.p_seriya = json["Data"]["p_seriya"].stringValue
                    clientInfo.p_nomer = json["Data"]["p_nomer"].stringValue
                    clientInfo.p_kem = json["Data"]["p_kem"].stringValue
                    clientInfo.p_kogda = json["Data"]["p_kogda"].stringValue
                    clientInfo.p_dogovor = json["Data"]["p_dogovor"].stringValue
                    clientInfo.p_dogovor2 = json["Data"]["p_dogovor2"].stringValue
                    clientInfo.p_papka = json["Data"]["p_papka"].stringValue
                    clientInfo.p_papka2 = json["Data"]["p_papka2"].stringValue
                    clientInfo.email = json["Data"]["email"].stringValue
                    clientInfo.advertiser = json["Data"]["advertiser"].stringValue
                    clientInfo.turn_ip = json["Data"]["turn_ip"].stringValue
                    clientInfo.turn_ip_time = json["Data"]["turn_ip_time"].stringValue
                    clientInfo.credit_time = json["Data"]["credit_time"].stringValue
                    clientInfo.change_tp_time = json["Data"]["change_tp_time"].stringValue
                    clientInfo.promotion_id = json["Data"]["promotion_id"].stringValue
                    clientInfo.nocredit = json["Data"]["nocredit"].stringValue
                    clientInfo.loyalty_client = json["Data"]["loyalty_client"].stringValue
                    clientInfo.is_blocked = json["Data"]["is_blocked"].stringValue
                    clientInfo.is_del = json["Data"]["is_del"].stringValue
                    clientInfo.acquaint = json["Data"]["acquaint"].stringValue
                    clientInfo.time_acquaint = json["Data"]["time_acquaint"].stringValue
                    clientInfo.password = json["Data"]["password"].stringValue
                    clientInfo.group_id = json["Data"]["group_id"].stringValue
                    clientInfo.utm_id = json["Data"]["utm_id"].stringValue
                    clientInfo.tariff_group = json["Data"]["tariff_group"].stringValue
                    clientInfo.utm_account = json["Data"]["utm_account"].stringValue
                    clientInfo.iptvid = json["Data"]["iptvid"].stringValue
                    clientInfo.unlimuntil = json["Data"]["unlimuntil"].stringValue
                    clientInfo.block_tp = json["Data"]["block_tp"].stringValue
                    clientInfo.jur_name = json["Data"]["jur_name"].stringValue
                    clientInfo.inn = json["Data"]["inn"].stringValue
                    clientInfo.pwd = json["Data"]["pwd"].stringValue
                    clientInfo.juridic = json["Data"]["juridic"].stringValue
                    clientInfo.cable_tv = json["Data"]["cable_tv"].stringValue
                    clientInfo.unsubscribe_reason = json["Data"]["unsubscribe_reason"].stringValue
                    clientInfo.delay_payment_reason = json["Data"]["delay_payment_reason"].stringValue
                    clientInfo.last_lk_action_time = json["Data"]["last_lk_action_time"].stringValue
                    clientInfo.is_active = json["Data"]["is_active"].stringValue
                    clientInfo.CTVOrderAvalaibality = json["Data"]["CTVOrderAvalaibality"].stringValue
                    clientInfo.address = Address(rn: json["Data"]["address"]["rn"].stringValue,
                                                 nn: json["Data"]["address"]["nn"].stringValue,
                                                 un: json["Data"]["address"]["un"].stringValue,
                                                 dn: json["Data"]["address"]["dn"].stringValue,
                                                 chast: json["Data"]["address"]["chast"].stringValue,
                                                 dn2: json["Data"]["address"]["dn2"].stringValue,
                                                 cable_tv: json["Data"]["address"]["cable_tv"].stringValue,
                                                 spec_tp: json["Data"]["address"]["spec_tp"].stringValue,
                                                 gb: json["Data"]["address"]["gb"].stringValue,
                                                 id: json["Data"]["address"]["id"].stringValue,
                                                 p: json["Data"]["address"]["p"].stringValue,
                                                 e: json["Data"]["address"]["e"].stringValue,
                                                 kn: json["Data"]["address"]["kn"].stringValue,
                                                 rid: json["Data"]["address"]["rid"].stringValue,
                                                 nid: json["Data"]["address"]["nid"].stringValue,
                                                 uid: json["Data"]["address"]["uid"].stringValue,
                                                 did: json["Data"]["address"]["did"].stringValue,
                                                 kid: json["Data"]["address"]["kid"].stringValue,
                                                 subnet: json["Data"]["address"]["subnet"].stringValue,
                                                 address_string: json["Data"]["address"]["address_string"].stringValue,
                                                 tip: json["Data"]["address"]["tip"].stringValue)
                    let traff = List<Tariff>()
                    for tarif in json["Data"]["utm"]["tariff"].arrayValue {
                        let ipAddreses = List<IPAddresses>()
                        for addres in tarif["ipAddresses"].arrayValue {
                            let ipItem = IPAddresses(ping: addres["ping"].stringValue,
                                                     gepon: addres["gepon"].stringValue,
                                                     activ: addres["activ"].stringValue,
                                                     ip: addres["ip"].stringValue,
                                                     slink_id: addres["slink_id"].stringValue,
                                                     mask: addres["mask"].stringValue)
                            ipAddreses.append(ipItem)
                        }
                        let tarifItem = Tariff(dp: tarif["dp"].stringValue,
                                               name: tarif["name"].stringValue,
                                               next_id: tarif["next_id"].stringValue,
                                               id: tarif["id"].stringValue,
                                               link_id: tarif["link_id"].stringValue,
                                               cost: tarif["cost"].stringValue,
                                               ipAddresses: ipAddreses)
                        traff.append(tarifItem)
                    }
                    // TODO: мне приходит пустой массив / надо будет потом доделать при необходимости macaddres
                    let additionalParams_wifimacs = List<String>()
                    for wifiMac in json["Data"]["utm"]["additionalParams"]["wifimacs"].arrayValue {
                        print(wifiMac)
                    }
                    print(traff)
                    clientInfo.utm = UTM(mob_phone: json["Data"]["utm"]["mob_phone"].stringValue,
                                         is_blocked: json["Data"]["utm"]["is_blocked"].stringValue,
                                         unlimited: json["Data"]["utm"]["unlimited"].stringValue,
                                         balance: json["Data"]["utm"]["balance"].stringValue,
                                         credit: json["Data"]["utm"]["credit"].stringValue,
                                         status: json["Data"]["utm"]["status"].stringValue,
                                         account_id: json["Data"]["utm"]["account_id"].stringValue,
                                         id: json["Data"]["utm"]["id"].stringValue,
                                         credit_time: json["Data"]["utm"]["credit_time"].stringValue,
                                         password: json["Data"]["utm"]["password"].stringValue,
                                         tariff: traff,
                                         additionalParams: AdditionalParams(sms_flag: json["Data"]["utm"]["additionalParams"]["sms_flag"].stringValue,
                                                                            credit_date: json["Data"]["utm"]["additionalParams"]["credit_date"].stringValue,
                                                                            wifimacs: additionalParams_wifimacs),
                                         lastPayment: LastPayment(sum: json["Data"]["utm"]["lastPayment"]["sum"].stringValue,
                                                                  date: json["Data"]["utm"]["lastPayment"]["date"].stringValue,
                                                                  login: json["Data"]["utm"]["lastPayment"]["login"].stringValue,
                                                                  comment: json["Data"]["utm"]["lastPayment"]["comment"].stringValue))
                    let tariffsItems = List<TariffsItem>()
                    json["Data"]["tariffs"].arrayValue.forEach({ (tarifJSON) in
                        tariffsItems.append(TariffsItem(id: tarifJSON["id"].stringValue,
                                                        price: tarifJSON["price"].stringValue,
                                                        param1: tarifJSON["param1"].stringValue,
                                                        param2: tarifJSON["param2"].stringValue,
                                                        param3: tarifJSON["param3"].stringValue,
                                                        show_in_lk: tarifJSON["show_in_lk"].stringValue,
                                                        nm_id: tarifJSON["nm_id"].stringValue,
                                                        name: tarifJSON["name"].stringValue))
                    })
                    clientInfo.tariffs = tariffsItems
                    let nm = List<NM>()
                    json["Data"]["linked_services"]["nm"].arrayValue.forEach({ (nmJSON) in
                        nm.append(NM(id: nmJSON["id"].stringValue,
                                     name: nmJSON["name"].stringValue,
                                     price: nmJSON["price"].stringValue,
                                     link_date: nmJSON["link_date"].stringValue,
                                     type: nmJSON["type"].stringValue))
                    })
                    let utm = List<Utm>()
                    json["Data"]["linked_services"]["utm"].arrayValue.forEach({ (utmJSON) in
                        utm.append(Utm(uid: utmJSON["uid"].stringValue,
                                       account_id: utmJSON["account_id"].stringValue,
                                       service_id: utmJSON["service_id"].stringValue,
                                       name: utmJSON["name"].stringValue,
                                       cost: utmJSON["cost"].stringValue,
                                       expire_date: utmJSON["expire_date"].stringValue,
                                       id: utmJSON["id"].stringValue))
                    })
                    let ls = LinkedServices(nm: nm, utm: utm)
                    clientInfo.linkedServices = ls
                    clientInfo.trustPaymentState = TrustPaymentState(state: json["Data"]["trustPaymentState"]["state"].stringValue,
                                                                     time: json["Data"]["trustPaymentState"]["time"].stringValue)
                    print(clientInfo)




                    DispatchQueue.main.async {
                        db.saveClientInfo(info: clientInfo)
                    }
                    completion(clientInfo)
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
