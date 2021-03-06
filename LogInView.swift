//
//  LogInView.swift
//  MalNet
//
//  Created by Богдан Олег on 24.04.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import UIKit
import RealmSwift

class LogInView: UIViewController {
    
    @IBOutlet weak var fieldLogin: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    
    let aut = Avtorization()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func login(_ sender: Any) {
        if fieldLogin.text?.isEmpty == true || fieldPassword.text?.isEmpty == true {
            self.present(ShowMessage.print(stitle: "Упс", smessage: "Пустые поля\nЗаполните их чем-нибудь", buttontext: "ОК"), animated: true, completion: nil)
        } else {
            let user = UserName(login: fieldLogin.text!, password: fieldPassword.text!)
            aut.userLogIn(user: user)
            performSegue(withIdentifier: "userIn", sender: self)
        }
        
    }
    

  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userIn" {
        }
    }
    */

}
