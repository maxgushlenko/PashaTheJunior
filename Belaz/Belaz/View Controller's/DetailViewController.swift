//
//  DetailViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/3/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var ratingImage: UIImageView!
    @IBOutlet var belazImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var capacityLabel: UILabel!
    
    var belaz: Belaz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title  = "Detail Info"
        
        // Do any additional setup after loading the view.
        
        guard let belaz = belaz else { return }
        
        let ratingImageGesture = UITapGestureRecognizer(target: self, action: #selector(openRating))
        ratingImage.isUserInteractionEnabled = true
        ratingImage.addGestureRecognizer(ratingImageGesture)
        ratingImage.backgroundColor = .green
        ratingImage.layer.cornerRadius = ratingImage.frame.height / 2
        
        belazImageView.image = belaz.image
        nameLabel.text = belaz.name
        typeLabel.text = belaz.type
        capacityLabel.text = "\(belaz.capacity)"
        ratingImage.image = Rating(rawValue: belaz.rating)?.image
        
    }
    
    @objc func openRating() {
        let ratingViewController = RateViewController()
        guard let navigationViewController = self.navigationController else { return }
        navigationViewController.pushViewController(ratingViewController, animated: true)
        ratingViewController.callback = { (pressedRating) in
            let realm = try! Realm()
            try! realm.write {
                self.belaz?.rating = pressedRating.rawValue
                self.ratingImage.image = Rating(rawValue: self.belaz!.rating)?.image
            }
        }
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
