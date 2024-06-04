//
//  ContentView.swift
//  CoreDataMVVM
//
//  Created by Oğuzhan Abuhanoğlu on 5.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State var textfieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                TextField("Add fruit here...", text: $textfieldText)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(
                        Color(.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    guard !textfieldText.isEmpty else { return }
                    vm.addData(text: textfieldText)
                    textfieldText = ""
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(
                            Color(.blue)
                        ).cornerRadius(10)
                        .padding(.horizontal)
                }
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No name")
                    }
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .navigationTitle("Fruits")
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
