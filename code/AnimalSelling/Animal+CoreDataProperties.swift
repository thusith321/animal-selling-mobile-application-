//
//  Animal+CoreDataProperties.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//
//

import Foundation
import CoreData


extension Animal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal")
    }

    @NSManaged public var name: String?
    @NSManaged public var breed: String?
    @NSManaged public var location: String?
    @NSManaged public var price: String?
    @NSManaged public var age: Int16
    @NSManaged public var animaldesc: String?
    @NSManaged public var selectedimage: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var dob: Date?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var weight: Double
    @NSManaged public var gender: String?

}

extension Animal : Identifiable {

}
