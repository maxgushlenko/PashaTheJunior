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

    deinit {
        notificationToken?.invalidate()
    }

    @IBOutlet var ratingImage: UIImageView!
    @IBOutlet var belazImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var capacityLabel: UILabel!
    
    @objc var belaz: Belaz?
    var notificationToken: NotificationToken?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title  = "Detail Info"

        notificationToken = belaz?.observe({ [weak self] (change) in
            guard
                let self = self,
                let belaz = self.belaz
                else { return }

            switch change {
            case .change(let properties):
                for property in properties {
                    if property.name == #keyPath(Belaz.rating) {
                        self.ratingImage.image = Rating(rawValue: belaz.rating)?.image
                    }
                }
            case .deleted, .error(_):
                break
            }
        })

        /*
         */
        
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
    
    // MARK: - 
    
    @objc func openRating() {
        let ratingViewController = RateViewController()
        ratingViewController.belaz = belaz

        guard let navigationViewController = self.navigationController else { return }
        navigationViewController.pushViewController(ratingViewController, animated: true)
    }
    
}
