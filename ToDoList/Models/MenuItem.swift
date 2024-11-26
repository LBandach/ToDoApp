//
//  MenuItem.swift
//  ToDoList
//
//  Created by user on 20/11/2024.
//

import Foundation

struct MenuItem: Identifiable, Equatable {
    let id: String
    let title: String
    let type: MenuItemType
}

enum MenuItemType {
    case newList
    case savedLists
    case settings
    case quit
}
