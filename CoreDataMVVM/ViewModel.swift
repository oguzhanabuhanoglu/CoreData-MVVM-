//
//  ViewModel.swift
//  CoreDataMVVM
//
//  Created by Oğuzhan Abuhanoğlu on 5.06.2024.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var savedEntities: [FruitsEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if error != nil {
                print("ERROR when creating Container!")
            } else {
                print("Container created SUCCESFULLY")
            }
        }
    }
    
    func fetchData() {
        let request = NSFetchRequest<FruitsEntity>(entityName: "FruitsEntity")
        
        do {
           savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error)")
        }
        
    }
    
    func addData(text: String) {
        let newFruit = FruitsEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    
    func saveData() {
        do {
            try container.viewContext.save()
            // to keep data updated
            fetchData()
        } catch let error {
            print("Error saving: \(error)")
        }
    }
    
    
    
    
}
