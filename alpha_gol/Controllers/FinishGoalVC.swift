//
//  FinishGoalVC.swift
//  alpha_gol
//
//  Created by Alex Villacres on 9/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit
import RealmSwift

class FinishGoalVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // Outlets
    @IBOutlet weak var goalCategoryPicker: UIPickerView!
    
    // Variables
    var categories: [String] = []
    var selectedCategory: String = "Business"
    var goalDescription: String!
    var goalType: String!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalCategoryPicker.dataSource = self
        goalCategoryPicker.delegate = self
        
        categories = ["Business", "Health", "Personal", "Fun"]
        
        print(goalDescription, goalType)
    }
    
    func initData(description: String, type: String) {
        self.goalDescription = description
        self.goalType = type
    }
    
    // Actions
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createBtnPressed(_ sender: Any) {
        save()
        dismissStack()
    }
    
    @IBAction func createCategoryPressed(_ sender: Any) {
        let addCategory = CreateCategoryVC()
        addCategory.modalPresentationStyle = .custom
        present(addCategory, animated: true, completion: nil)
    }
    
    // PickerView set up
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = categories[row]
    }
    
    // Realm Logic
    func save() {
        
        let newGoal = Goal()
        newGoal.goalDescription = goalDescription
        newGoal.goalType = goalType
        newGoal.goalCategory = selectedCategory
        newGoal.isCompleted = false
        
        try! realm.write {
            realm.add(newGoal)
        }
    }
    
}
