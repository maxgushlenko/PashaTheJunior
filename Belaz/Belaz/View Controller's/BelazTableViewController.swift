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
    
    @objc func openScreen() {
        let addViewController = AddViewController()
        guard let navigationViewController = self.navigationController else { return }
        navigationViewController.pushViewController(addViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trainingCellNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(trainingCellNib, forCellReuseIdentifier: "CustomCell")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openScreen))
//        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        
        self.navigationItem.title = "Belaz List"
        self.navigationItem.rightBarButtonItems = [addButton]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        belazes = DataManager.shared.belazes
        tableView.reloadData()
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
        
        //Share
        
//        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: { (action, indexPath) -> Void in
//            let defaultText = "Belaz " + self.belazes[indexPath.row].name
//            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
//            self.present(activityController , animated: true, completion: nil)
//        })
        
        //Delete
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action, indexPath) -> Void in
            DataManager.shared.delete(belaz: self.belazes[indexPath.row])
            self.belazes = DataManager.shared.belazes
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        })
        
        return [deleteAction]
    }
    
}
