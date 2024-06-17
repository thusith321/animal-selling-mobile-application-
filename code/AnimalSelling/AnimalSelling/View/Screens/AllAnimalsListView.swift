//
//  AllAnimalsListView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI
import CoreData

struct AllAnimalsListView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dob, order:.reverse)]) var animal: FetchedResults<Animal>
    
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var currentDate = Date()
    @State private var showingAddView = false
    @State private var selectedimage: Data = .init(count: 0)
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(animal){ animal in
                        NavigationLink(destination:
                          SpecificAnimalListView(animal:animal)) {
                            
                            HStack (alignment: .center) {
                                VStack(alignment: .leading) {
                                    if let imageData = animal.selectedimage, let uiImage = UIImage(data: imageData) {
                                        Image(uiImage: uiImage)
                                            .renderingMode(.original)
                                            .resizable()
                                            .frame(width: 200)
                                            .cornerRadius(25)
                                            .shadow(radius: 6)
                                            .padding(.leading, 50)
                                    }
                                    Spacer()
                                    Spacer()
                                    if animal.name != nil {
                                        Text("Animal Name   : \(animal.name ?? "")").bold()
                                           }
                                    if animal.price != nil {
                                        Text("Price   : \(animal.price ?? "")").bold()
                                           }
                                    if animal.location != nil {
                                        Text("Location              : \(animal.location ?? "")").bold()
                                           }
                                  
                                }
                                .frame(height: 250)
                                Spacer()
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("All Animals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showingAddView.toggle()
                    } label :{
                      Label("Add Animal", systemImage: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddAnimalView()
            }
        }
        .navigationViewStyle(.stack)
    }
    //display all
    private func totalCaloriesToday() -> Double {
        var caloriesToday :Double = 0
          for item in animal {
              if Calendar.current.isDateInToday(item.dob!){
                  caloriesToday += item.weight
              }
        }
        return caloriesToday
    }
}

struct AllAnimalsListView_Previews: PreviewProvider {
    static var previews: some View {
        AllAnimalsListView()
    }
}
