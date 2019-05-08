//
//  BelazTableViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 4/17/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

class BelazTableViewController: UITableViewController {

    var belazes: [Belaz] = DataManager.shared.belazes
    
//    var belazIsChoose = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]thubnailImageView.image = UIImage(named: belaz.image)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return belazes.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIdentifier, for: indexPath) as! CustomCell

        cell.belaz = belazes[indexPath.row]
        cell.accessoryType = belazes[indexPath.row].isChoose ? .checkmark : .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "Меню" , preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let isChooseTitle:String
        
        isChooseTitle = belazes[indexPath.row].isChoose ? "Отмена" : "Выбрать"
        
        let isChooseAction = UIAlertAction(title: isChooseTitle, style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            if self.belazes[indexPath.row].isChoose {
                self.belazes[indexPath.row].isChoose = false
            } else {
                self.belazes[indexPath.row].isChoose = true
            }
            
            cell?.accessoryType = self.belazes[indexPath.row].isChoose ? .checkmark : .none
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
        let defaultText = "Белаз " + self.belazes[indexPath.row].name
        let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController , animated: true, completion: nil)
        })
        
        //Delete
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить", handler: {(acin, indexPath) -> Void in
            self.belazes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            })

        shareAction.backgroundColor = .blue
        
        return [shareAction, deleteAction]
    }
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destenationController = segue.destination as! DetailViewController
                destenationController.belazImage = belazes[indexPath.row].imageName
                destenationController.belazName = belazes[indexPath.row].name
                destenationController.belazType = belazes[indexPath.row].type
                destenationController.belazCapacity = String(belazes[indexPath.row].capacity)
            }
        }
    }
    
}
