//
//  ContentView.swift
//  Todo
//
//  Created by Dean Hope on 20/07/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore: TaskStore
    @State var newTaskName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("New Task", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: addTask) {
                    Text("Add Task")
                }
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(12)
                NavigationLink(destination: TaskListView(taskStore: taskStore)) {
                        Text("Go to Task List")
                }
            }
        }
    }
    
    private func addTask() {
        taskStore.addTask(name: newTaskName)
        newTaskName = ""
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(taskStore: TaskStore())
        }
    }
}
