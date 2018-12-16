//
//  StatView.swift
//  MalNet
//
//  Created by Богдан Олег on 26.04.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import UIKit

class StatView: UIViewController {
    
    
    @IBOutlet weak var beginDate: UITextField!
    @IBOutlet weak var endDate: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func serStartDate(_ sender: UITextField) {
        let datePicker:UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.setValue(UIColor.red, forKey: "textColor")
        datePicker.locale = NSLocale.init(localeIdentifier: "RU") as Locale
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePikerValueChange1), for: UIControl.Event.valueChanged)
        let bar = UIToolbar()
        bar.barStyle = .default
        bar.tintColor = UIColor.red
        bar.sizeToFit()
        let doneItem = UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneEdit1))
        bar.setItems([doneItem], animated: false)
        bar.isUserInteractionEnabled = true
        beginDate.inputAccessoryView = bar
        
        
    }
    @objc func doneEdit1() {
        beginDate.resignFirstResponder()
    }
    @objc func datePikerValueChange1(sender: UIDatePicker) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = DateFormatter.Style.medium
        dateFormat.timeStyle = DateFormatter.Style.none
        dateFormat.dateFormat = "dd.MM.yyyy"
        beginDate.text = dateFormat.string(from: sender.date)
    }
    
    
    @IBAction func setEndDate1(_ sender: UITextField) {
        let datePicker:UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.setValue(UIColor.red, forKey: "textColor")
        datePicker.locale = NSLocale.init(localeIdentifier: "RU") as Locale
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePikerValueChange2), for: UIControl.Event.valueChanged)
        let bar = UIToolbar()
        bar.barStyle = .default
        bar.tintColor = UIColor.red
        bar.sizeToFit()
        let doneItem = UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneEdit2))
        bar.setItems([doneItem], animated: false)
        bar.isUserInteractionEnabled = true
        endDate.inputAccessoryView = bar
    }
    @objc func doneEdit2() {
        endDate.resignFirstResponder()
    }
    @objc func datePikerValueChange2(sender: UIDatePicker) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = DateFormatter.Style.medium
        dateFormat.timeStyle = DateFormatter.Style.none
        dateFormat.dateFormat = "dd.MM.yyyy"
        endDate.text = dateFormat.string(from: sender.date)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
