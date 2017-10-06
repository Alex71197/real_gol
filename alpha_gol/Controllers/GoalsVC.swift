//
//  ViewController.swift
//  alpha_gol
//
//  Created by Alex Villacres on 9/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit
import RealmSwift

class GoalsVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var goals = List<Goal>()
    var rowHeight: CGFloat = 70
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = rowHeight
        
        let goal = realm.objects(Goal.self)
        for i in 0..<2 {
            goals.append(goal[i])
        }

    }
    
    
    // Actions
    @IBAction func addBtnPressed(_ sender: Any) {
        guard let addGoalVC = storyboard?.instantiateViewController(withIdentifier: "addGoalVC") else { return }
        presentFirst(viewControllerToPresent: addGoalVC)
    }


}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.goalDescriptionLbl.text = goal.goalDescription
        cell.goalTypeLbl.text = goal.goalType
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

