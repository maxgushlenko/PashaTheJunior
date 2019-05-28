//
//  RateViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/24/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit
import RealmSwift

class RateViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var badImage: UIButton!
    @IBOutlet var goodImage: UIButton!
    @IBOutlet var greatImage: UIButton!

    var belaz: Belaz?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badImage.layer.cornerRadius = badImage.frame.height / 2
        goodImage.layer.cornerRadius = goodImage.frame.height / 2
        greatImage.layer.cornerRadius = greatImage.frame.height / 2
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0, y: 500 )
        let doubleTransform = scale.concatenating(translation)
        stackView.transform = doubleTransform
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurVisualEffect = UIVisualEffectView(effect: blurEffect)
        blurVisualEffect.frame = view.bounds
        
        backgroundImage.addSubview(blurVisualEffect)
        
        navigationItem.title = "Add Rating!"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.stackView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    // MARK: - 
    
    @IBAction func rateSelect(sender: UIButton) {
        let realm = try! Realm()
        try! realm.write {
            belaz?.rating = sender.tag
        }

        navigationController?.popViewController(animated: true)
    }
    
}
