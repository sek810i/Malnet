//  LogInView.swift
//  MalNet
//
//  Created by Богдан Олег on 24.04.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.

import UIKit
import Realm

protocol ILogInView: class {
    func showAlert(message: String)
    func goToMainScreen()
}

class LogInView: UIViewController, ILogInView {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var fieldLogin: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!{
        didSet {
            fieldPassword.isSecureTextEntry = true
        }
    }
    
    //MARK: - variable
    
    
    var controller: ILogInViewController?
    
    func setupMVC() {
        let viewController = self
        let model = LogInViewModel()
        let controller = LogInViewController()
        model.controller = controller
        controller.model = model
        controller.view = viewController
        viewController.controller = controller
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            self.present(ShowMessage.print(stitle: "Ошибка", smessage: message, buttontext: "ОК"), animated: true, completion: nil)
        }
    }
    
    func goToMainScreen() {
        performSegue(withIdentifier: "userIn", sender: self)
    }
    
    
    @IBAction func login(_ sender: Any) {
        if fieldLogin.text?.isEmpty == true || fieldPassword.text?.isEmpty == true {
            self.present(ShowMessage.print(stitle: "Упс", smessage: "Пустые поля\nЗаполните их чем-нибудь", buttontext: "ОК"), animated: true, completion: nil)
        } else {
            controller?.sendLogin(login: fieldLogin.text!, password: fieldPassword.text!)
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
