//
//  AnimalSellingApp.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI

@main
struct AnimalSellingApp: App {
    @StateObject private var dataCpntroller = DataController()
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environment(\.managedObjectContext, dataCpntroller.container.viewContext)
        }
    }
}
