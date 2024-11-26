//
//  AddNewItemView.swift
//  ToDoList
//
//  Created by user on 21/11/2024.
//

import SwiftUI

struct CreateItemView: View {
    
    @StateObject var viewModel = CreateItemViewModel()
    @Environment(\.dismiss) var dismiss
        
    
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
                    viewModel.save()
                } label: {
                    Text("Save")
                }
                
                Button {
                    viewModel.showCancelConfirmation = true
                } label: {
                    Text("Cancel")
                }
            }
            
        }
        .alert("Are you sure you want to cancel?", isPresented: $viewModel.showCancelConfirmation) {
            Button("Yes", role: .destructive) {
                viewModel.cancel()
            }
            Button("No", role: .cancel) {
                viewModel.showCancelConfirmation = false
            }
        }
        .onChange(of: viewModel.shouldDissmis) {
            dismiss()
        }
    }
}

#Preview {
    CreateItemView()
}
