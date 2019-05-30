//
//  BelazTableViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 4/17/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit
import RealmSwift

class BelazTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var belazes: [Belaz] = []
    var notificationToken: NotificationToken?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        let belazesRealmResult = realm.objects(Belaz.self)
        notificationToken = belazesRealmResult.observe { [weak self] (changes) in
            guard let self = self else { return }

            self.belazes = DataManager().belazes
            self.tableView.reloadData()
        }

        /*
         */
        
        let belazCellNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(belazCellNib, forCellReuseIdentifier: "CustomCell")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openScreen))
        
        self.navigationItem.title = "Belaz List"
        self.navigationItem.rightBarButtonItems = [addButton]
    }
    
    // MARK: - 
    
    @objc func openScreen() {
        let addViewController = AddViewController()
        guard let navigationViewController = self.navigationController else { return }
        navigationViewController.pushViewController(addViewController, animated: true)
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return belazes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.belaz = belazes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.belaz = belazes[indexPath.row]
        
        guard let navigationViewController = self.navigationController else { return }
        navigationViewController.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Delete
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action, indexPath) -> Void in
            DataManager().delete(belaz: self.belazes[indexPath.row])
        })
        
        return [deleteAction]
    }
    
}
