//
//  ContentView.swift
//  ToDoList
//
//  Created by user on 18/11/2024.
//

import SwiftUI
import CoreData

struct ListView: View {
    @StateObject var viewModel: ListViewModel = ListViewModel()
    @State var isAddNewItemPresented: Bool = false

    var body: some View {
        VStack {
            Text("List View")
            
            ForEach(viewModel.list) { item in
                Text(item.title)
            }
            .onDelete(perform: viewModel.deleteItems)

        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button {
                    isAddNewItemPresented = true
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .navigationDestination(isPresented: $isAddNewItemPresented) {
            CreateItemView()
        }
    }
}

#Preview {
    ListView()
}
