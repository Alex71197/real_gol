//
//  GoalCell.swift
//  alpha_gol
//
//  Created by Alex Villacres on 9/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit
import RealmSwift

class GoalCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    
    // Variables
    let realm = try! Realm()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configureCell() {
//        let goal = realm.objects(Goal.self)
//
//        goalDescriptionLbl.text = goal.goalDescription
//        goalTypeLbl.text = goal.goalType
//    }

}
