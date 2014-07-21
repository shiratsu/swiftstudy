//
//  TaskManager.swift
//  TodoList
//
import UIKit

var taskMgr : TaskManager = TaskManager()

struct task{
    var name = "Un-Named"
    var desc = "UnDescribed"
}

class TaskManager: NSObject {
    var tasks = task[]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
}
