//
//  AddNewItemView.swift
//  ToDoList
//
//  Created by user on 21/11/2024.
//

import SwiftUI

struct CreateItemView: View {
    
    @StateObject var viewModel = CreateItemViewModel()
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showCancelConfirmation = false
    
    
    var body: some View {
        VStack {
            HStack {
                TextField(text: $viewModel.newItem.title) {
                    Text("Note Title")
                }
                .fixedSize()
            }

            HStack {
                Button {
                    listViewModel.save(item: viewModel.newItem)
                    viewModel.cancel()
                } label: {
                    Text("Save")
                }
                
                Button {
                    showCancelConfirmation = true
                } label: {
                    Text("Cancel")
                }
            }
            
        }
        .alert("Are you sure you want to cancel?", isPresented: $showCancelConfirmation) {
            Button("Yes", role: .destructive) {
                viewModel.cancel()
            }
            Button("No", role: .cancel) {
                showCancelConfirmation = false
            }
        }
        .onChange(of: viewModel.shouldDissmis) {
            dismiss()
        }
        
    }
}

#Preview {
    let listViewModel = ListViewModel()
    CreateItemView()
        .environmentObject(listViewModel)
}
