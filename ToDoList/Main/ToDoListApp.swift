//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by user on 18/11/2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let persistenceController = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.managedObjectContext, persistenceController.persistentContainer.viewContext)
        }
    }
}
