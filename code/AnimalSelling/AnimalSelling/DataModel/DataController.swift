//
//  DataController.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "AnimalModel")
    
    init() {
        container.loadPersistentStores {
            desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    //save
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Animal data saved")
        }catch {
            print("Failed to save animal data")
        }
    }
    
    //add
    func addAnimal(age:Int16 ,weight:Double, gender:String, animaldesc:String, breed:String, isFavourite:Bool, location:String, name:String, price:String,
        context:NSManagedObjectContext){
        let animal = Animal(context: context)
        animal.id = UUID()
        animal.age = age
        animal.animaldesc = animaldesc
        animal.breed = breed
        animal.dob = Date()
        animal.isFavourite = isFavourite
        animal.location = location
        animal.name = name
        animal.price = price
        
        save(context: context)
//        Int16(duration)
    }
    
    //edit
    func editAnimal(animal:Animal, age:Int16 ,weight:Double, gender:String, animaldesc:String, breed:String, isFavourite:Bool, location:String, name:String, price:String,
        context:NSManagedObjectContext){
        animal.age = age
        animal.animaldesc = animaldesc
        animal.breed = breed
        animal.dob = Date()
        animal.isFavourite = isFavourite
        animal.location = location
        animal.name = name
        animal.price = price
        
        save(context: context)
    }
}
