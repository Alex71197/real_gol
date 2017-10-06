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
    var goals: Results<Goal>!
    var rowHeight: CGFloat = 70
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goals = realm.objects(Goal.self)
        print(goals)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = rowHeight
        reload()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(goals)
        reload()
    }
    
    
    // Actions
    @IBAction func addBtnPressed(_ sender: Any) {
        guard let addGoalVC = storyboard?.instantiateViewController(withIdentifier: "addGoalVC") else { return }
        presentFirst(viewControllerToPresent: addGoalVC)
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        try! realm.write {
            let goal = goals[indexPath.row]
            realm.delete(goal)
        }
    }
    
    func checkGoal(atIndexPath indexPath: IndexPath) {
        try! realm.write {
            let goal = goals[indexPath.row]
            goal.isCompleted = true
        }
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let checkAction = UITableViewRowAction(style: .default, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.reload()
        }
        checkAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return [checkAction]
    }
    
}

