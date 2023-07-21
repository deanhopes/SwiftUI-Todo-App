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
    var isHidden: Bool = false
}

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(name: String) {
        let task = Task(name: name)
        tasks.append(task)
    }

    func removeTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }

    func hideTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isHidden = true
        }
    }
}

