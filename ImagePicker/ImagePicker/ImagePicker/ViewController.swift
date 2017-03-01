//
//  ViewController.swift
//  ImagePicker
//
//  Created by Appinventiv on 28/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    // OUTLETS
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var chooseImageButton: UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imagePickerController.delegate = self
       }
    
    let imagePickerController = UIImagePickerController()
    
    // HANDLING THE TAP ON THE CHOOSE IMAGE BUTTON
    
    @IBAction func chooseImageButtonTapped(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose Photo", preferredStyle: .actionSheet)
        
        // ACTION SHEET'S ACTION FOR CAMERA
        
        actionSheet.addAction(UIAlertAction(title :"Camera" , style : .default , handler: {(action: UIAlertAction) in
        
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                imagePickerController.sourceType = .camera
                
                self.present(imagePickerController, animated: true, completion: nil)
            }
                
            else
                
            {
                
                print(" Camera Not Available")
                
            }
        
        }))
        
        // ACTION SHEET'S ACTION  FOR GALLERY
        
        actionSheet.addAction(UIAlertAction(title :"Gallery" , style : .default , handler: {(action: UIAlertAction) in
        
        
            imagePickerController.sourceType = .photoLibrary
            
            self.present(imagePickerController, animated: true, completion: nil )
}))
        
        
        // ACTION SHEET'S ACTION FOR CANCEL
        
        actionSheet.addAction(UIAlertAction(title :"Cancel" , style : .cancel , handler: nil))
            
        self.present(actionSheet, animated: true, completion: nil )
        
}
    
    // WHEN THE USER IS DONE AFTER PICKING THE MEDIA THIS FUNCTION IS CALLED
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let images = info[UIImagePickerControllerOriginalImage]
        
        image.image = images as? UIImage
        
        self.dismiss(animated: true, completion: nil )
    }
    
    // WHEN THE USER DID SELECTS CANCEL 
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true, completion: nil )
    }
    
}

