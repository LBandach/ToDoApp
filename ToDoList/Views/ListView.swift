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
    @State var isShowingAddNewItemView: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.list) { item in
                    NavigationLink {
                        Text("Details for \(item.title)")
                    } label: {
                        Text(item.title)
                    }
                }
                .onDelete(perform: viewModel.deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        isShowingAddNewItemView = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                    
                }
            }
            .navigationDestination(isPresented: $isShowingAddNewItemView) {
                CreateItemView()
                    .environmentObject(viewModel)
            }
        }
        
    }
        

    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
