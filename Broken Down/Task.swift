//
//  Task.swift
//  Broken Down
//
//  Created by Meiling Thompson on 8/10/19.
//  Copyright © 2019 Meiling Thompson. All rights reserved.
//

import Foundation

enum TaskType {
    case daily, weekly, todo
}

struct Task {
    var name : String
    var type : TaskType
    var completed : Bool
    var lastCompleted : NSDate?
}
