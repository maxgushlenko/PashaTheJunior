//
//  RateViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/24/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var badImage: UIButton!
    @IBOutlet var goodImage: UIButton!
    @IBOutlet var greatImage: UIButton!
    
    var callback: ((Rating)->())?
    
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
    
    
    
    @IBAction func rateSelect(sender: UIButton) {
        switch sender.tag {
        case 1: callback?(Rating.bad)
//        case 2: callback?(Rating(rawValue: sender.tag)!)
        case 2: callback?(Rating.good)
        case 3: callback?(Rating.great)
        default: break
        }
        navigationController?.popViewController(animated: true)
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
