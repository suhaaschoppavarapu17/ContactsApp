//
//  ThirdViewController.swift
//  Assignment12
//
//  Created by Suhaas Choppavarapu on 9/4/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

protocol UpdatedDetailsDelegate {
    func detailsDidChange(name: String,phoneNumber: String)
}

class ThirdViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK:- Properties
    var updatedDelegate: UpdatedDetailsDelegate?
    
    var name3: String?
    var phoneNumber3 : String?
    
    var editedName: String?
    var editedPhoneNumber: String?
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTexField.text = name3
        phoneNumberTextField.text = phoneNumber3
        view.backgroundColor = UIColor.lightGray
    }
    
    // MARK:- IBActions
    @IBAction func submitButtonTapped(_ sender: Any) {
        editedName = nameTexField.text
        editedPhoneNumber = phoneNumberTextField.text
        updatedDelegate?.detailsDidChange(name: editedName!,phoneNumber: editedPhoneNumber!)
        
        let alertController = UIAlertController(title: "Succesfull",
                                                message: "Changes have been saved",
                                                preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok",
                                        style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
