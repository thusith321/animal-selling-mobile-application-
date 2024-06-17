//
//  EditAnimalView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI
import PhotosUI

struct EditAnimalView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var animal: Animal
    
      @State private var name: String
      @State private var breed: String
      @State private var gender = "Male"
      @State private var location: String
      @State private var age: Int16
      @State private var animaldesc: String
      @State private var selectedDate: Date
//      @State private var isFavourite: Bool
      @State private var price: String
      @State private var weight: Double
      @State private var selectedimage: Data
      @State private var selectedItems: [PhotosPickerItem] = []
    
    init(animal: Animal) {
           self.animal = animal
           _name = State(initialValue: animal.name ?? "")
           _breed = State(initialValue: animal.breed ?? "")
           _gender = State(initialValue: animal.gender ?? "")
           _location = State(initialValue: animal.location ?? "")
           _age = State(initialValue: animal.age)
           _animaldesc = State(initialValue: animal.animaldesc ?? "")
           _selectedDate = State(initialValue: animal.dob ?? Date())
//           _isFavourite = State(initialValue: animal.isFavourite ?? false)
           _price = State(initialValue: animal.price ?? "")
           _weight = State(initialValue: animal.weight )
           _selectedimage = State(initialValue: animal.selectedimage ?? Data(count: 0))
       }
    
    
    var body: some View {
        Form {
            Text("Edit Animal Details")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color(UIColor(red: 0.08, green: 0.11, blue: 0.33, alpha: 1.0)))
                .padding(.leading, 36)
            Section {
                HStack {
                    Text("Animal Name : ")
                    TextField("Enter Animal Name", text: $name)
                }
                HStack {
                    Text("Animal Breed :")
                    TextField("Enter Animal Breed", text: $breed)
                }
                HStack {
                    Text("Gender : ")
                    Spacer()
                    Picker("", selection: $gender) {
                        Text("Male").tag("Male")
                        Text("Female").tag("Female")
                    }
                    .pickerStyle(.segmented)
                }
                HStack {
                    Text("Animal Location :")
                    TextField("Enter Animal Location", text: $location)
                }
                HStack {
                    Text("Animal Description :")
                    TextField("Enter Description", text: $animaldesc)
                }
                DatePicker("Date of Birth :", selection: $selectedDate, displayedComponents: .date)
                
                HStack {
                    Text("Enter Price :")
                    TextField("Enter Price", text: $price)
                }
                HStack {
                    Text("Select Weight Kg: \(Int(weight))")
                    Slider(value: $weight, in: 0...100, step: 5)
                }
                HStack {
                    Spacer()
                    
                    //MARK: PhotoPicker
                    PhotosPicker(selection: $selectedItems,
                                 maxSelectionCount: 1,
                                 matching: .images) {
                        if !selectedimage.isEmpty, let uiImage = UIImage(data: selectedimage) {
                            Image(uiImage: uiImage)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(8)
                                .shadow(radius: 5)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .shadow(radius: 5)
                                .foregroundColor(.gray)
                        }
                    }
                    //MARK: PhotoPicker
                    Spacer()
                }
                .onChange(of: selectedItems) { newItems in
                    guard let items = newItems.first else { return }
                    items.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data = data {
                                selectedimage = data
                            } else {
                                print("No data :(")
                            }
                        case .failure(let error):
                            fatalError("\(error)")
                        }
                    }
                }
                // Closing brace for the Section moved here
                
                HStack {
                    Button(action: {
                        // Update the existing Animal object instead of creating a new one
                        animal.name = name
                        animal.breed = breed
                        animal.gender = gender
                        animal.dob = selectedDate
                        animal.weight = weight
                        animal.price = price
                        animal.location = location
                        animal.age = age
                        animal.animaldesc = animaldesc
                        animal.selectedimage = selectedimage
                        
                        // Save the changes
                        try! managedObjContext.save()
                        
                        dismiss()
                    }) {
                        Text("Update")
                            .frame(width: 100, height: 40)
                            .background(Color(UIColor(red: 0.08, green: 0.11, blue: 0.33, alpha: 1.0)))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                    .disabled(name.count > 2 && breed.count > 2 && !selectedimage.isEmpty ? false : true)
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Cancel")
                            .frame(width: 100, height: 40)
                            .background(Color(UIColor(red: 0.08, green: 0.11, blue: 0.33, alpha: 1.0)))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                  
                    .padding(.trailing)
                }
            }
        }
    }
    
}
