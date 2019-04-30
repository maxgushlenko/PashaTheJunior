//
//  BelazTableViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 4/17/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

class BelazTableViewController: UITableViewController {
    
    var belazNames = ["7540", "7544", "7545", "7547", "7555", "7557", "7558", "7513", "7513R", "7517", "7518", "7530", "7531", "7532", "7560", "7571"]

    var belazImages = ["7540.jpg", "7544.jpg", "7545.jpg", "7547.jpg", "7555.jpg", "7557.jpg", "7558.jpg", "7513.jpg", "7513R.jpg", "7517.jpg", "7518.jpg", "7530.jpg", "7531.jpg", "7532.jpg", "7560.jpg", "7571.jpg"]
    
    var belazType = ["Disiel Yamz", "Disiel Cummins", "Disiel MTU", "Disiel MTU", "Disiel Cummins", "Siemiens", "DC Belaz", "Electrosila", "Robot transmission", "DC Belaz", "Electrosila", "DC Belaz", "General electric", "Electrosila", "Genral electric", "Siemiens"]
    
    var belazCapacity = ["20", "30", "35", "40", "55", "70", "90", "130", "130", "160", "180", "200", "240", "290", "320", "450"]
    
    var belazIsChoose = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return belazNames.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell

        cell.thubnailImageView?.image = UIImage(named: belazImages[indexPath.row])
        cell.nameLabel?.text = belazNames[indexPath.row]
        cell.typeLabel?.text = belazType[indexPath.row]
        cell.capacityLabel?.text = belazCapacity[indexPath.row]
        
        if belazIsChoose[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        cell.thubnailImageView.layer.cornerRadius = 30.0
        cell.thubnailImageView.clipsToBounds = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "Меню" , preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let isChooseTitle:String
        
        if belazIsChoose[indexPath.row] {
            isChooseTitle = "Отмена"
        } else {
            isChooseTitle = "Выбрать"
        }
        
        let isChooseAction = UIAlertAction(title: isChooseTitle, style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            if self.belazIsChoose[indexPath.row] {
                self.belazIsChoose[indexPath.row] = false
            } else {
                self.belazIsChoose[indexPath.row] = true
            }
            
            if self.belazIsChoose[indexPath.row] {
                cell?.accessoryType = .checkmark
            } else {
                cell?.accessoryType = .none
            }

        })
        
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Сервис недоступен", message: "Попробуйте позвоните позже", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Позвонить " + "+375-29-123-00-\(indexPath.row)", style: .default, handler: callActionHandler)
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(isChooseAction)
        self.present(optionMenu, animated: true , completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Share
        
        let shareAction = UITableViewRowAction(style: .default, title: "Поделится", handler: { (action, indexPath) -> Void in
        let defaultText = "Белаз " + self.belazNames[indexPath.row]
        let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
        self.present(activityController , animated: true, completion: nil)
        })
        
        //Delete
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить", handler: {(acin, indexPath) -> Void in
            
            self.belazCapacity.remove(at: indexPath.row)
            self.belazImages.remove(at: indexPath.row)
            self.belazType.remove(at: indexPath.row)
            self.belazNames.remove(at: indexPath.row)
            self.belazIsChoose.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
                
            })
        shareAction.backgroundColor = .blue
        
        return [shareAction, deleteAction]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
