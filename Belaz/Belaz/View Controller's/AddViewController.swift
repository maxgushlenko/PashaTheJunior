//
//  AddViewController.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/13/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var addImage: UIImageView!
    @IBOutlet var addNameTextField: UITextField!
    @IBOutlet var addTypeTextField: UITextField!
    @IBOutlet var addCapacityTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (param) in
            self.view.frame.origin.y = -200
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (param) in
            self.view.frame.origin.y = 0.0
        }
        
        let selectImage = UITapGestureRecognizer(target: self, action: #selector(showImagePicker))
        addImage.isUserInteractionEnabled = true
        addImage.addGestureRecognizer(selectImage)
        
        self.addNameTextField.delegate = self
        self.addTypeTextField.delegate = self
        self.addCapacityTextField.delegate = self
        self.navigationItem.title = "Add Belaz"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addObject))
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - 
    
    @objc func showImagePicker() {
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
        
        DispatchQueue.global().async {
            do {
                try DataManager().add(belaz: newBelaz)
                DispatchQueue.main.async {
                    guard let navigationViewController = self.navigationController else { return }
                    navigationViewController.popViewController(animated: true)
                }
            } catch {
                if  error is RealmError,
                    let error = error as? RealmError
                {
                    DispatchQueue.main.async {
                        let errorAlert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
                        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(errorAlert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        addImage.contentMode = .scaleAspectFit
        addImage.clipsToBounds = true
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
