//
//  MessegeTableView.swift
//  MalNet
//
//  Created by Oleg Bogdan on 16.08.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import UIKit

class MessegeTableView: UITableViewController {
    
    var messeges = [Messege]()
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messeges.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))
        messeges.append(Messege(test: 2))
        messeges.append(Messege(test: 1))

        
        tableView.estimatedRowHeight = 44
        tableView?.rowHeight = UITableView.automaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        scrollToBottom()
    }
    
    func addNewMeaasge(mes:String) {
        messeges.append(Messege(sType: "User",sName: "User",text: mes))
        if messeges.count>0{
           // self.tableView.scrollToRow(at: IndexPath(item: messeges.count-1, section: 0), at: .bottom, animated: true)
            scrollToBottom()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messeges.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        
        cell.sizeToFit()
        cell.malnetTextMessage?.text = ""
        cell.userTextMessage?.text = ""
        //вариант разметки по тексту

        if messeges[indexPath.row].senderType == "Malnet" {
            cell.malnetTextMessage?.isHidden = false
            cell.malnetImageCloud?.isHidden = false
            cell.userTextMessage?.isHidden = true
            cell.userImageCloud?.isHidden = true
            cell.malnetTextMessage?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.malnetImageCloud?.image =  #imageLiteral(resourceName: "malnetmessage")
            cell.malnetTextMessage?.text = messeges[indexPath.row].text
            //cell.malnetTextMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
            //cell.malnetImageCloud.setNeedsUpdateConstraints()
            //cell.textLabel?.text = String(describing: cell.malnetImageCloud?.frame.height)
            
        } else if messeges[indexPath.row].senderType == "User"{
            cell.malnetTextMessage?.isHidden = true
            cell.malnetImageCloud?.isHidden = true
            cell.userTextMessage?.isHidden = false
            cell.userImageCloud?.isHidden = false
            cell.userTextMessage?.textColor = #colorLiteral(red: 0.9294117647, green: 0.1098039216, blue: 0.137254902, alpha: 1)
            cell.userTextMessage?.text = messeges[indexPath.row].text
            cell.userImageCloud?.image = #imageLiteral(resourceName: "usermessage")
            //cell.userTextMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
            //cell.userImageCloud.setNeedsUpdateConstraints()
            //cell.textLabel?.text = String(describing: cell.userImageCloud?.frame.height)

        }
        cell.sizeToFit()

        return cell
        
    }
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
