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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTypePicker.delegate = self
        goalTypePicker.dataSource = self
        
        listOfTypes = ["Daily", "Weekly", "Monthly"]

        // Do any additional setup after loading the view.
    }
    
    // Actions
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
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
    
}
