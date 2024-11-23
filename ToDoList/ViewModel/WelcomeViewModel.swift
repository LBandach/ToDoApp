//
//  WelcomeViewViewModel.swift
//  ToDoList
//
//  Created by user on 20/11/2024.
//

import Foundation

class WelcomeViewModel: ObservableObject {
    let menuItems: [MenuItem] = [
        MenuItem(id: "1", title: "Create new list", type: .newList),
        MenuItem(id: "2", title: "Saved lists", type: .savedLists),
        MenuItem(id: "3", title: "Settings", type: .settings),
        MenuItem(id: "4", title: "Quit", type: .quit)
    ]

}
