//
//  SpecificAnimalListView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI

struct SpecificAnimalListView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    var animal: Animal // Existing Animal object
    
    @State private var showingDeleteAlert = false
    @State private var showingEditView = false
    @State private var editedAnimalName = ""
    @State private var editedbreed = ""
    @State private var editage = ""
    @State private var editedgender = ""
    @State private var editedlocation = ""
    @State private var  editedanimaldesc = ""
    @State private var editedDate = Date()
    @State private var editedWeight = 0

    
    var body: some View {
        Form {
            Section {
                HStack{
                    Text("\(animal.name ?? "")")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color(UIColor(red: 0.08, green: 0.11, blue: 0.33, alpha: 1.0)))
                        .padding(.leading, 26)
                }

                HStack{
                    if let imageData = animal.selectedimage, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .padding(.leading, 46)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .foregroundColor(.gray)
                            .padding(.leading, 46)
                    }
                    Spacer()
                }
                Text("Animal Name: \(animal.name ?? "")")
                Text("Animal Breed: \(animal.breed ?? "")")
                Text("Animal Gender: \(animal.gender ?? "")")
                Text("Animal Location: \(animal.location ?? "")")
//                Text("Animal Age: \(animal.age ?? 5)")
                Text("Animal Description: \(animal.animaldesc ?? "")")
                Text("Date of Birth: \(formatDate(date: animal.dob))")
                Text("Animal Price: \(animal.price ?? "")")

                //edit button
                .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing){
                   Button {
                     showingEditView.toggle()
                     } label :{
                       Label("Edit Food", systemImage: "pencil.circle.fill")
                       .foregroundColor(.black)
                       .bold()
                      }
                    }
               }
                    .sheet(isPresented: $showingEditView) {
                        EditAnimalView(animal: animal)
                 }
            }
            //delete
            Section {
                Button(action: {
                    showingDeleteAlert.toggle()
                }) {
                    Text("Delete Animal")
                        .foregroundColor(.red)
                }
            }
        }
        .alert(isPresented: $showingDeleteAlert) {
            Alert(
                title: Text("Delete Animal"),
                message: Text("Are you sure you want to delete this Animal?"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Delete"), action: deleteAnimal)
            )
        }
    }
    private func deleteAnimal() {
        withAnimation {
            managedObjContext.delete(animal)
            saveContext()
        }
    }

    
    private func saveContext() {
        do {
            try managedObjContext.save()
        } catch {
            print("Error saving  \(error)")
        }
    }

    private func formatDate(date: Date?) -> String {
        guard let date = date else {
            return ""
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none

        return dateFormatter.string(from: date)
    }
}
