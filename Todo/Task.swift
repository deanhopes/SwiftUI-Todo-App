//
//  Task.swift
//  Todo
//
//  Created by Dean Hope on 20/07/2023.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var completed = false
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
    
    func addTask(name: String) {
        let newTask = Task(name: name)
        tasks.append(newTask)
    }
}
