//
//  ContentView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
     TabView{
        HomeView()
          .tabItem{
        Image(systemName: "house")
          Text("Home")
         }
         
         AllAnimalsListView()
           .tabItem{
         Image(systemName: "pawprint.circle")
           Text("Animals")
          }

        MapPresentView()
           .tabItem{
         Image(systemName: "mappin.circle")
           Text("Map")
          }

        ProfileView()
           .tabItem{
          Image(systemName: "person.circle")
            Text("Profile")
         }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
