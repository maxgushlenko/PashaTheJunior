//
//  DetailViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/3/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var belazImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var capacityLabel: UILabel!
    
    var belaz: Belaz?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let belaz = belaz else { return }
        
        belazImageView.image = belaz.image
        nameLabel.text = belaz.name
        typeLabel.text = belaz.type.rawValue
        capacityLabel.text = "\(belaz.capacity)"
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
