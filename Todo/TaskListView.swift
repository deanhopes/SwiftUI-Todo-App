//
//  TaskListView.swift
//  Todo
//
//  Created by Dean Hope on 20/07/2023.
//

import SwiftUI
import UIKit

func generateHapticFeedback() {
    let generator = UIImpactFeedbackGenerator(style: .medium)
    generator.impactOccurred()
}

struct TaskListView: View {
    @ObservedObject var taskStore: TaskStore
    
    var body: some View {
        List {
            ForEach(taskStore.tasks) { task in
                Text(task.name)
                    .transition(AnyTransition.move(edge: .trailing).combined(with: .scale).combined(with: .opacity))
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {
                            generateHapticFeedback()
                            withAnimation(.easeInOut(duration: 0.2)) {
                                taskStore.removeTask(task: task)
                            }
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                        
                        Button(action: {
                            
                            withAnimation(.easeInOut(duration: 0.2)) {
                                taskStore.hideTask(task: task)
                            }
                        }) {
                            Label("Hide", systemImage: "eye.slash")
                        }
                        .tint(.blue)
                    }
            }
        }
    }
}


struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskStore: TaskStore())
    }
}
