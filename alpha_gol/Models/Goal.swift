//
//  Goal.swift
//  alpha_gol
//
//  Created by Alex Villacres on 9/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import Foundation
import RealmSwift

class Goal: Object {
    @objc dynamic var goalDescription: String!
    @objc dynamic var goalCategory: String!
    @objc dynamic var goalType: String!
}
