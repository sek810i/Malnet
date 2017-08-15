//
//  SettingsView.swift
//  MalNet
//
//  Created by Богдан Олег on 24.04.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import UIKit


class SettingsView: UIViewController {
    
    let aut = Avtorization()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogOff(_ sender: Any) {
        aut.logout()
        performSegue(withIdentifier: "logout", sender: self)
        
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        self.present(ShowMessage.print(stitle: "Сохранение", smessage: "Настройки сохранены", buttontext: "ОК"), animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
