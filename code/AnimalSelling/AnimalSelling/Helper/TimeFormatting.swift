//
//  TimeFormatting.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import Foundation

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.mm.dd"
    let formattedDate = dateFormatter.string(from: date)
    return formattedDate

}
