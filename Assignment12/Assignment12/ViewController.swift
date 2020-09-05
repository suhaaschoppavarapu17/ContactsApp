//
//  ViewController.swift
//  Assignment12
//
//  Created by Suhaas Choppavarapu on 9/4/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UpdatedInFVCDelegate {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    var names = [["Anil", "Ayush", "Anish","Abhinay", "Arun", "Aarya"],
                 ["Bhanu", "Britany","Bannu", "Bharath","Bhivesh", "Bryan"],
                 ["Chaitu", "Chinni","charitha", "Ceaser","Catherine", "Camreo"],
                 ["Dinesh", "Dhruva","Daddy", "Don","Diana", "Drakshayini"]]
    
    var phoneNumbers = [["6715439890", "8978654387", "7577747756","6715439890", "8978654387", "7577747756"],
                        ["9089876757", "9878876540","9089876757", "9878876540","9089876757", "9878876540"],
                        ["9897867567", "6175654388","9089876757", "9878876540","9089876757", "9878876540"],
                        ["9897867567", "6175654388","9089876757", "9878876540","9089876757", "9878876540"]]
    
    var indexValue: Int = 0
    var sectionCount: Int = 0
    
    var finalUpdatedName: String?
    var finalUpdatedPhoneNumber: String?
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.lightGray
        tableView.tableFooterView = UIView()
        //        var namesInOrder = names.sort{ ($0[0] as? String) < ($1[0] as? String) }
        //        var namesInOrder = names[0].sorted(by : <)
        //        print(namesInOrder)
    }
    
    //MARK:- Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController {
            destination.name2 = names[sectionCount][indexValue]
            destination.phoneNumber2 = phoneNumbers[sectionCount][indexValue]
            destination.updatedInFVC = self
        }
    }
    
    //MARK:- Helper Methods
    func detailsNeedToBeUpdated(name: String, phoneNumber: String) {
        finalUpdatedName = name
        finalUpdatedPhoneNumber = phoneNumber
        names[sectionCount].remove(at: indexValue)
        names[sectionCount].insert(finalUpdatedName!, at: indexValue)
        phoneNumbers[sectionCount].remove(at: indexValue)
        phoneNumbers[sectionCount].insert(finalUpdatedPhoneNumber!, at: indexValue)
        tableView.reloadData()
    }
}

//MARK:- UITableViewDataSource and UITableViewDelegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier) as? FirstTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = names[indexPath.section][indexPath.row]
        cell.phoneNumberLabel.text = phoneNumbers[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sectionCount = indexPath.section
        indexValue = indexPath.row
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headertitle: String?
        if section == 0{
            headertitle = "A"
        }
        if section == 1{
            headertitle = "B"
        }
        if section == 2{
            headertitle = "C"
        }
        if section == 3{
            headertitle = "D"
        }
        return headertitle
    }
}

//MARK:- UITableViewCell
class FirstTableViewCell: UITableViewCell {
    static let identifier = "firstCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
}


