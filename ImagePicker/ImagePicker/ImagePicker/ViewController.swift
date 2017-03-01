//
//  ViewController.swift
//  ImagePicker
//
//  Created by Appinventiv on 28/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    var arrayOfUIImagePickerView = [" RED", " BLUE", " YELLOW"]
    
    var placeHolder = 0
    
    // OUTLETS
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var chooseImageButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        
    super.viewDidLoad()
        
    // ASSIGNING THE DELEGATE OF THE IMAGE PICKER
        
    imagePickerController.delegate = self
      
    // ASSINGNING THE DATASOURCE AND DELEGATES OF THE PICKER VIEW
        
    pickerView.dataSource = self
    pickerView.delegate = self
        
       }
    
    let imagePickerController = UIImagePickerController()
    
    // HANDLING THE TAP ON THE CHOOSE IMAGE BUTTON
    
    @IBAction func chooseImageButtonTapped(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
         label.text = arrayOfUIImagePickerView[row]
    }
    
    // ON THE TAP OF THE SUBMIT BUTTON THE TEXT OF THE LABEL WOULD CHANGE
    
}

 // MARK: EXTENSION OF UIPICKER VIEW

extension ViewController : UIPickerViewDelegate , UIPickerViewDataSource
    
{
    // RETURNING THE COMPONENTS IN A PICKER VIEW
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // RETURNING THE NUMBER OF ROWS IN COMPONENT
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arrayOfUIImagePickerView.count
    }
    
    // RETURNING THE TITLE FOR ROW
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       
        return arrayOfUIImagePickerView[row]
    }
    
}

