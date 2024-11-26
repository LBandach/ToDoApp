//
//  WelcomeView.swift
//  ToDoList
//
//  Created by user on 18/11/2024.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    
    @StateObject private var viewModel = WelcomeViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                List(viewModel.menuItems) { menuItem in
                    NavigationLink {
                        destination(for: menuItem)
                    } label: {
                        Text(menuItem.title)
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: 200)
            }
            .background(Color.teal)
        }
    }
    
    @ViewBuilder
    func destination(for item: MenuItem) -> some View {
        switch item.type {
        case .newList:
            ListView()
        case .savedLists:
            Text("Saved list view")
        case .settings:
            Text("Settings")
        case .quit:
            Text("Exiting App...")
                .onAppear {
                    exit(0)
                }
        }
    }
}

#Preview {
    WelcomeView()
}
