//
//  Action.swift
//  mlapp
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import Foundation

struct Action : Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: ()-> Void
}
