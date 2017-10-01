//
//  CreateCategoryVC.swift
//  alpha_gol
//
//  Created by Alex Villacres on 9/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit

class CreateCategoryVC: UIViewController {

    // Outlets
    @IBOutlet weak var categoryNameTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(CreateCategoryVC.closeTap(_:)))
        self.view.addGestureRecognizer(closeTouch)
        
    }
    
    // Actions
    @IBAction func createGoalPressed(_ sender: Any) {
        
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func closeTap(_ recognizer: UIGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
