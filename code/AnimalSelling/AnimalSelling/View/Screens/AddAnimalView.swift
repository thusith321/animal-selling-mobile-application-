//
//  AddAnimalView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI
import PhotosUI

struct AddAnimalView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var breed = ""
    @State private var gender = "Male"
    @State private var location = ""
    @State private var age: String = ""
    @State private var animaldesc = ""
    @State private var selectedDate = Date()
    
    @State private var isFavourite = ""
    @State private var price = ""
    @State private var weight : Double = 0
    @State private var selectedimage: Data = .init(count: 0)
    @State private var selectedItems: [PhotosPickerItem] = []
    
    
    var body: some View {
        Form  {
            Text("Add New Animal")
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
                            Text("Animal Age :")
                            TextField("Enter Animal Age", text: $age)
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
                            Text("Select Weight : \(Int(weight))")
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
                        //MARK: HStack
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
                    }
                 
            HStack{
                Button(action: {
                    //MARK: Lets add data to the database( CoreData )
                    let new = Animal(context: self.managedObjContext)
                    new.id = UUID()
                    new.animaldesc = self.animaldesc
                    new.breed = self.breed
                    new.dob = self.selectedDate
                    new.location = self.location
                    new.name = self.name
                    new.price = self.price
                    new.selectedimage = self.selectedimage
                    
                    //MARK: Lets save the data permanently
                    do {
                        try self.managedObjContext.save()
                    } catch {
                        print("Error saving data: \(error)")
                    }
                    
                    //MARK: Lets dismiss the AddAnimalView
                    dismiss()
                    
                    self.name = ""
                    self.animaldesc = ""
                    self.breed = ""
                    self.location = ""
                    self.name = ""
                    self.price = ""
                    self.selectedimage.count = 0
                }) {
                    Text("Save")
                        .frame(width: 300, height: 40)
                        .background(Color(UIColor(red: 0.08, green: 0.11, blue: 0.33, alpha: 1.0)))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                Spacer()
                    .buttonStyle(.borderedProminent)
                    .disabled(self.name.count > 2 && self.selectedimage.count != 0 ? false : true)
                  }
                }
            }
        }

struct AddAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnimalView()
    }
}


