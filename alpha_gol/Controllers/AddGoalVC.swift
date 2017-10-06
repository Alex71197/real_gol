//
//  AddGoalVC.swift
//  alpha_gol
//
//  Created by Alex Villacres on 9/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit

class AddGoalVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Outlets
    @IBOutlet weak var goalDescription: UITextView!
    @IBOutlet weak var goalTypePicker: UIPickerView!
    
    // Variables
    var listOfTypes: [String] = [String]()
    var selectedType: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTypePicker.delegate = self
        goalTypePicker.dataSource = self
        
        listOfTypes = ["Daily", "Weekly", "Monthly", "Custom"]

        // Do any additional setup after loading the view.
    }
    
    // Actions
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalDescription.text != "" && goalDescription.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalDescription.text, type: selectedType)
            presentFirst(viewControllerToPresent: finishGoalVC)
        }
    }
    
    // PickerView Setup
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfTypes[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = listOfTypes[row]
    }
    
}
