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
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            TaskListView(taskStore: taskStore)
            HStack {
                TextField("New Task", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50) // Increase height here
                    .padding(EdgeInsets(top:4, leading: 20, bottom: 4, trailing: 0)) // Increase left padding here
                Button(action: addTask) {
                    Text("+")
                        .frame(minWidth: 24, maxWidth: 40)
                        .frame(height: 16)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(EdgeInsets(top:0, leading: 0, bottom: 0, trailing: 24))
            }
            .padding(.bottom, keyboardHeight)
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                let value = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height / 24
                keyboardHeight = height
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                keyboardHeight = 0
            }
        }
        .preferredColorScheme(.dark) // Set color scheme to dark mode
    }
    
    private func addTask() {
        withAnimation {
            taskStore.addTask(name: newTaskName)
            newTaskName = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
