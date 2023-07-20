//
//  TodoApp.swift
//  Todo
//
//  Created by Dean Hope on 20/07/2023.
//

import SwiftUI

@main
struct TodoApp: App {
    // This is your shared instance of TaskStore
    @StateObject var taskStore = TaskStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(taskStore: taskStore)
        }
    }
}
