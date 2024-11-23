//
//  AddNewItemViewModel.swift
//  ToDoList
//
//  Created by user on 21/11/2024.
//

import Foundation
import SwiftUI

class CreateItemViewModel: ObservableObject {
    
    @Published var shouldDissmis: Bool = false
    @State var newItem: ListItem = ListItem(id: UUID(), title: "")
    
    func cancel() {
        shouldDissmis = true
    }
    
}
