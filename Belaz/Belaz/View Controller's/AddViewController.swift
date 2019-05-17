//
//  AddViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/13/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var addImage: UIImageView!
    @IBOutlet var addNameTextField: UITextField!
    @IBOutlet var addTypeTextField: UITextField!
    @IBOutlet var addCapacityTextField: UITextField!
    
    @objc func addImageView() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func addObject() {
        
        guard
            let name = addNameTextField.text, name.count > 0,
            let type = addTypeTextField.text, type.count > 0,
            let capacity = addCapacityTextField.text, capacity.count > 0,
            let image = addImage.image
            else {
                let alertController = UIAlertController(title: "Error", message: "add data or add image", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return
        }
        
        let newBelaz = Belaz()
        newBelaz.imageData = image.pngData()
        newBelaz.name = name
        newBelaz.type = type
        newBelaz.capacity = capacity
        DataManager.shared.add(belaz: newBelaz)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addImageView))
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addObject))
        
        self.navigationItem.title = "AddView"
        self.navigationItem.rightBarButtonItems = [saveButton, addButton]
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        addImage.contentMode = .scaleAspectFit
        addImage.clipsToBounds = true
        
        dismiss(animated: true, completion: nil)
        
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
