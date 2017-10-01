//
//  FinishGoalVC.swift
//  alpha_gol
//
//  Created by Alex Villacres on 9/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // Outlets
    @IBOutlet weak var goalCategoryPicker: UIPickerView!
    
    // Variables
    var listOfCategories: [Category] = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Actions
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func createCategoryPressed(_ sender: Any) {
        
    }
    
    // PickerView set up
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfCategories[row].categoryName
    }
    
}
