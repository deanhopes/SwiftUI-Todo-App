//
//  TaskListView.swift
//  Todo
//
//  Created by Dean Hope on 20/07/2023.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskStore: TaskStore
    var body: some View {
        List {
            ForEach(taskStore.tasks) { task in
                Text(task.name)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .scale))
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskStore: TaskStore())
    }
}
