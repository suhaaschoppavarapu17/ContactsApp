//
//  SecondViewController.swift
//  Assignment12
//
//  Created by Suhaas Choppavarapu on 9/4/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

protocol UpdatedInFVCDelegate{
    func detailsNeedToBeUpdated(name: String, phoneNumber: String)
}

class SecondViewController: UIViewController, UpdatedDetailsDelegate {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    //MARK:- Properties
    var name2: String?
    var phoneNumber2 : String?
    
    var updatedName: String?
    var updatedPhoneNumber: String?
    
    var updatedInFVC: UpdatedInFVCDelegate?
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name2
        phoneNumberLabel.text = phoneNumber2
        
        view.backgroundColor = UIColor.lightGray
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.done, target: self, action: #selector(goBackToFirstView))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK:- Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ThirdViewController {
            if updatedName == nil && updatedPhoneNumber == nil {
                destination.name3 = name2
                destination.phoneNumber3 = phoneNumber2
                destination.updatedDelegate = self
                destination.title = name2! + " Details"
            } else {
                destination.name3 = updatedName
                destination.phoneNumber3 = updatedPhoneNumber
                destination.updatedDelegate = self
                destination.title = updatedName! + " Details"
            }
        }
    }
    
    // MARK:- IBActions
    @IBAction func editButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "secondSegue", sender: nil)
    }
    
    //MARK:- Helper Methods
    @objc
    func goBackToFirstView() {
        if updatedName != nil || updatedPhoneNumber != nil {
            updatedInFVC?.detailsNeedToBeUpdated(name: updatedName!, phoneNumber: updatedPhoneNumber!)
        }
        onClose()
    }
    
    func onClose(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func detailsDidChange(name: String, phoneNumber: String) {
        updatedName = name
        updatedPhoneNumber = phoneNumber
        nameLabel.text = updatedName
        phoneNumberLabel.text = updatedPhoneNumber
    }
}
