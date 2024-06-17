//
//  ScrollViewBtn.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI

struct ScrollViewBtn: View {
    var icon = ""
    var text = ""
    var function : () -> Void
    var body: some View {
        
        VStack{
            Rectangle()
                .frame(width: 106, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 15,style: .continuous))
                .foregroundColor(Color(red: 0.886274516582489, green: 0.9215686912536621, blue: 0.95686274766922))
            
                .overlay(){
                    Image(icon)
                        .resizable()
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(width: 63, height: 70)
                        .padding(.top, -13)
                }
       
                Text(text)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.black)
        }
    }
}
