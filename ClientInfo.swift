//
//  ClientInfo.swift
//  MalNet
//
//  Created by Oleg Bogdan on 17/12/2018.
//  Copyright © 2018 Богдан Олег. All rights reserved.
//

import Foundation
import RealmSwift

class ClientInfo: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var KvartiraID: String = ""
    @objc dynamic var login: String = ""
    @objc dynamic var wi_fi_code: String = ""
    @objc dynamic var fio: String = ""
    @objc dynamic var nik: String = ""
    @objc dynamic var burn: Int = 0
    @objc dynamic var p_seriya: String = ""
    @objc dynamic var p_nomer: String = ""
    @objc dynamic var p_kem: String = ""
    @objc dynamic var p_kogda: String = ""
    @objc dynamic var p_dogovor: String = ""
    @objc dynamic var p_dogovor2: String = ""
    @objc dynamic var p_papka: String = ""
    @objc dynamic var p_papka2: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var advertiser: String = ""
    @objc dynamic var turn_ip: String = ""
    @objc dynamic var turn_ip_time: String = ""
    @objc dynamic var credit_time: String = ""
    @objc dynamic var change_tp_time: String = ""
    @objc dynamic var promotion_id: String = ""
    @objc dynamic var nocredit: String = ""
    @objc dynamic var loyalty_client: String = ""
    @objc dynamic var is_blocked: String = ""
    @objc dynamic var is_del: String = ""
    @objc dynamic var acquaint: String = ""
    @objc dynamic var time_acquaint: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var group_id: String = ""
    @objc dynamic var utm_id: String = ""
    @objc dynamic var tariff_group: String = ""
    @objc dynamic var utm_account: String = ""
    @objc dynamic var iptvid: String = ""
    @objc dynamic var unlimuntil: String = ""
    @objc dynamic var block_tp: String = ""
    @objc dynamic var jur_name: String = ""
    @objc dynamic var inn: String = ""
    @objc dynamic var pwd: String = ""
    @objc dynamic var juridic: String = ""
    @objc dynamic var cable_tv: String = ""
    @objc dynamic var unsubscribe_reason: String = ""
    @objc dynamic var delay_payment_reason: String = ""
    @objc dynamic var last_lk_action_time: String = ""
    @objc dynamic var is_active: String = ""
    @objc dynamic var CTVOrderAvalaibality: String = ""
    @objc dynamic var address: Address? = nil
    @objc dynamic var utm: UTM? = nil
    var tariffs: List<TariffsItem> = List<TariffsItem>()
    @objc dynamic var linkedServices: LinkedServices? = nil
    @objc dynamic var trustPaymentState: TrustPaymentState? = nil

    override static func primaryKey() -> String?{
        return "id"
    }

}

class Address: Object {
    @objc dynamic var rn: String = ""
    @objc dynamic var nn: String = ""
    @objc dynamic var un: String = ""
    @objc dynamic var dn: String = ""
    @objc dynamic var chast: String = ""
    @objc dynamic var dn2: String = ""
    @objc dynamic var cable_tv: String = ""
    @objc dynamic var spec_tp: String = ""
    @objc dynamic var gb: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var p: String = ""
    @objc dynamic var e: String = ""
    @objc dynamic var kn: String = ""
    @objc dynamic var rid: String = ""
    @objc dynamic var nid: String = ""
    @objc dynamic var uid: String = ""
    @objc dynamic var did: String = ""
    @objc dynamic var kid: String = ""
    @objc dynamic var subnet: String = ""
    @objc dynamic var address_string: String = ""
    @objc dynamic var tip: String = ""
    
    convenience init(rn: String,
                     nn: String,
                     un: String,
                     dn: String,
                     chast: String,
                     dn2: String,
                     cable_tv: String,
                     spec_tp: String,
                     gb: String,
                     id: String,
                     p: String,
                     e: String,
                     kn: String,
                     rid: String,
                     nid: String,
                     uid: String,
                     did: String,
                     kid: String,
                     subnet: String,
                     address_string: String,
                     tip: String) {
        self.init()
        self.rn = rn
        self.nn = nn
        self.dn = un
        self.dn = dn
        self.chast = chast
        self.dn2 = dn2
        self.cable_tv = cable_tv
        self.spec_tp = spec_tp
        self.gb = gb
        self.id = id
        self.p = p
        self.e = e
        self.kn = kn
        self.rid = rid
        self.nid = nid
        self.uid = uid
        self.did = did
        self.kid = kid
        self.subnet = subnet
        self.address_string = address_string
        self.tip = tip
    }
}

class UTM: Object {
    @objc dynamic var mob_phone: String = ""
    @objc dynamic var is_blocked: String = ""
    @objc dynamic var unlimited: String = ""
    @objc dynamic var balance: String = ""
    @objc dynamic var credit: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var account_id: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var credit_time: String = ""
    @objc dynamic var password: String = ""
    var tariff: List<Tariff> = List<Tariff>()
    @objc dynamic var additionalParams: AdditionalParams? = nil
    @objc dynamic var lastPayment: LastPayment? = nil
    
    convenience init(mob_phone: String,
                     is_blocked: String,
                     unlimited: String,
                     balance: String,
                     credit: String,
                     status: String,
                     account_id: String,
                     id: String,
                     credit_time: String,
                     password: String,
                     tariff: List<Tariff>,
                     additionalParams: AdditionalParams,
                     lastPayment: LastPayment) {
        self.init()
        self.mob_phone = mob_phone
        self.is_blocked = is_blocked
        self.unlimited = unlimited
        self.balance = balance
        self.credit = credit
        self.status = status
        self.account_id = account_id
        self.id = id
        self.credit_time = credit_time
        self.password = password
        self.tariff = tariff
        self.additionalParams = additionalParams
        self.lastPayment = lastPayment
    }
    
}

class Tariff: Object {
    @objc dynamic var dp: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var next_id: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var link_id: String = ""
    @objc dynamic var cost: String = ""
    var ipAddresses: List<IPAddresses> = List<IPAddresses>()
    
    convenience init(dp: String,
                     name: String,
                     next_id: String,
                     id: String,
                     link_id: String,
                     cost: String,
                     ipAddresses: List<IPAddresses>) {
        self.init()
        self.dp = dp
        self.name = name
        self.next_id = next_id
        self.id = id
        self.link_id = link_id
        self.cost = cost
        self.ipAddresses = ipAddresses
    }
}

class IPAddresses: Object {
    @objc dynamic var ping: String = ""
    @objc dynamic var gepon: String = ""
    @objc dynamic var activ: String = ""
    @objc dynamic var ip: String = ""
    @objc dynamic var slink_id: String = ""
    @objc dynamic var mask: String = ""
    
    convenience init(ping: String,
                     gepon: String,
                     activ: String,
                     ip: String,
                     slink_id: String,
                     mask: String) {
        self.init()
        self.ping = ping
        self.gepon = gepon
        self.activ = activ
        self.ip = ip
        self.slink_id = slink_id
        self.mask = mask
    }
}

class AdditionalParams: Object {
    @objc dynamic var sms_flag: String = ""
    @objc dynamic var credit_date: String = ""
    var wifimacs: List<String> = List<String>()
    
    convenience init(sms_flag: String,
                     credit_date: String,
                     wifimacs: List<String>) {
        self.init()
        self.sms_flag = sms_flag
        self.credit_date = credit_date
        self.wifimacs = wifimacs
    }

}

class LastPayment: Object {
    @objc dynamic var sum: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var login: String = ""
    @objc dynamic var comment: String = ""
    
    convenience init(sum: String,
                     date: String,
                     login: String,
                     comment: String) {
        self.init()
        self.sum = sum
        self.date = date
        self.login = login
        self.comment = comment
    }

}

class TariffsItem: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var param1: String = ""
    @objc dynamic var param2: String = ""
    @objc dynamic var param3: String = ""
    @objc dynamic var show_in_lk: String = ""
    @objc dynamic var nm_id: String = ""
    @objc dynamic var name: String = ""
    
    convenience init(id: String,
                     price: String,
                     param1: String,
                     param2: String,
                     param3: String,
                     show_in_lk: String,
                     nm_id: String,
                     name: String) {
        self.init()
        self.id = id
        self.price = price
        self.param1 = param1
        self.param2 = param2
        self.param3 = param3
        self.show_in_lk = show_in_lk
        self.nm_id = nm_id
        self.name = name
    }
}

class LinkedServices: Object {
    var nm: List<NM> = List<NM>()
    var utm: List<Utm> = List<Utm>()
    
    convenience init(nm: List<NM>,
                     utm: List<Utm>) {
        self.init()
        self.nm = nm
        self.utm = utm
    }

}

class NM: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var link_date: String = ""
    @objc dynamic var type: String = ""
    
    convenience init(id: String,
                     name: String,
                     price: String,
                     link_date: String,
                     type: String) {
        self.init()
        self.id = id
        self.name = name
        self.price = price
        self.link_date = link_date
        self.type = type
    }
}

class Utm: Object {
    @objc dynamic var uid: String = ""
    @objc dynamic var account_id: String = ""
    @objc dynamic var service_id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var cost: String = ""
    @objc dynamic var expire_date: String = ""
    @objc dynamic var id: String = ""

    convenience init(uid: String,
                     account_id: String,
                     service_id: String,
                     name: String,
                     cost: String,
                     expire_date: String,
                     id: String) {
        self.init()
        self.uid = uid
        self.account_id = account_id
        self.service_id = service_id
        self.name = name
        self.cost = cost
        self.expire_date = expire_date
        self.id = id
    }

}

class TrustPaymentState: Object {
    @objc dynamic var state: String = ""
    @objc dynamic var time: String = ""
    
    convenience init(state: String,
                     time: String) {
        self.init()
        self.state = state
        self.time = time
    }
}

