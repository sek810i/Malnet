//
//  MainView.swift
//  MalNet
//
//  Created by Богдан Олег on 24.04.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import UIKit

protocol IMainView: class {
    func loadData()
    func showData()
    func showError(message: String)
}

class MainView: UIViewController, IMainView {
    
    //MARK: - Outlets
    @IBOutlet weak var infoView: UIView! {
        didSet {
            infoView.layer.cornerRadius = 10
            infoView.layer.borderWidth = 1
            infoView.layer.borderColor = UIColor.clear.cgColor
            infoView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var balanseLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var tarifLabel: UILabel!
    @IBOutlet weak var statusIcon: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    // MARK: - variable
    var controller: IMainController?
    
    // MARK: - MVC
    
    func setupMVC() {
        let viewController = self
        let model = MainModel()
        let controller = MainController()
        model.controller = controller
        controller.model = model
        controller.view = viewController
        viewController.controller = controller
    }

    // MARK: - life circle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IMainView
    
    func loadData() {
        
    }
    
    func showData() {
        
    }
    
    func showError(message: String) {
        
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
