//
//  AnimalSellingTests.swift
//  AnimalSellingTests
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import XCTest
import CoreData
import SwiftUI
@testable import AnimalSelling

final class AnimalSellingTests: XCTestCase {
    var context: NSManagedObjectContext!
        
        override func setUpWithError() throws {
            try super.setUpWithError()
            
            let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
            let persistentStoreDescription = NSPersistentStoreDescription()
            persistentStoreDescription.type = NSInMemoryStoreType
            let container = NSPersistentContainer(name: "Animal Selling", managedObjectModel: managedObjectModel)
            container.persistentStoreDescriptions = [persistentStoreDescription]
            container.loadPersistentStores { _, error in
                XCTAssertNil(error, "Failed to load the persistent store: \(error?.localizedDescription ?? "")")
            }
            
            context = container.viewContext
        }
        
        override func tearDownWithError() throws {
            context = nil
            try super.tearDownWithError()
        }
        
    func testAddAnimal() throws {
        let age: Int16 = 2
              let weight: Double = 10.5
              let gender = "Male"
              let animalDesc = "Test Description"
              let breed = "Test Breed"
              let isFavourite = false
              let location = "Test Location"
              let name = "Test Animal"
              let price = "100"
        
        
        addAnimal(
                  age: age,
                  weight: weight,
                  gender: gender,
                  animalDesc: animalDesc,
                  breed: breed,
                  isFavourite: isFavourite,
                  location: location,
                  name: name,
                  price: price,
                  context: context
              )
       
        let fetchRequest: NSFetchRequest<Animal> = Animal.fetchRequest()
               let animals = try context.fetch(fetchRequest)
               XCTAssertEqual(animals.count, 1, "One animal should be added")
               
               let animal = animals.first
               XCTAssertEqual(animal?.age, age, "Age should match")
               XCTAssertEqual(animal?.weight, weight, "Weight should match")
               XCTAssertEqual(animal?.gender, gender, "Gender should match")
               XCTAssertEqual(animal?.animaldesc, animalDesc, "Animal description should match")
               XCTAssertEqual(animal?.breed, breed, "Breed should match")
               XCTAssertEqual(animal?.isFavourite, isFavourite, "IsFavorite should match")
               XCTAssertEqual(animal?.location, location, "Location should match")
               XCTAssertEqual(animal?.name, name, "Name should match")
               XCTAssertEqual(animal?.price, price, "Price should match")
        
           }

    func addAnimal(
        age: Int16,
        weight: Double,
        gender: String,
        animalDesc: String,
        breed: String,
        isFavourite: Bool,
        location: String,
        name: String,
        price: String,
        context: NSManagedObjectContext
    ) {
        let animal = Animal(context: context)
        animal.age = age
        animal.weight = weight
        animal.gender = gender
        animal.animaldesc = animalDesc
        animal.breed = breed
        animal.isFavourite = isFavourite
        animal.location = location
        animal.name = name
        animal.price = price
        
        save(context: context)
    }
        func save(context: NSManagedObjectContext) {
               do {
                   try context.save()
               } catch {
                   XCTFail("Failed to save the managed object context: \(error.localizedDescription)")
               }
           }
       }
