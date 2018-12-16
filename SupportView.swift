//
//  SupportView.swift
//  MalNet
//
//  Created by Oleg Bogdan on 15.08.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import UIKit

class SupportView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var needConst: NSLayoutConstraint!
    var keyBoardHeight: CGFloat = 0
    
    @IBOutlet weak var messagesView: UIView!
    
    @IBOutlet weak var newMessageView: UIView!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBAction func sendMessage(_ sender: Any) {
        (children[0] as? MessegeTableView)?.addNewMeaasge(mes: (messageTextField?.text)!)
        (children[0] as? MessegeTableView)?.tableView.reloadData()
        (children[0] as? MessegeTableView)?.tableView.updateConstraints()
        messageTextField?.text=""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        messageTextField.returnKeyType = .default
        messageTextField.delegate = self as UITextFieldDelegate
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyBoardHeight = keyBoardHeight == 0 ? keyboardSize.height-self.newMessageView.frame.height: keyBoardHeight
            needConst.constant = -keyBoardHeight
            (children[0] as? MessegeTableView)?.scrollToBottom()
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        needConst.constant = 0
    }
 

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="message"{
            let view = segue.destination as! MessegeTableView
            view.addNewMeaasge(mes: (messageTextField?.text)!)
            view.tableView.reloadData()
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
