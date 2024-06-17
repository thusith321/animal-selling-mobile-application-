//
//  ProfileView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

//import SwiftUI
//
//struct ProfileView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("profile") // Replace "profile_image" with the name of your profile image asset
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .shadow(radius: 5)
            
            Text("Thusith Hettiarachchi")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Sri Lanka Institute of Information Technology")
                .font(.subheadline)
            
            Divider()
            
            InfoRowView(label: "Email", value: "thusiththiwanka.tth@gmail.com")
            InfoRowView(label: "Phone", value: "011-222134441")
            InfoRowView(label: "Location", value: "Kandy")
            
            Divider()
            
            HStack{
                Text("     About me")
                          .font(.headline)
                          .frame(maxWidth: .infinity, alignment: .leading).bold()

            }
            
            ScrollView{
                Text("My name is Thusith Hettiarachchi and I'm currently following BSc(Hons) Information technology specialised in Software engineering at Sri Lanka Institute of Information Technology.\n\nI'm currently in my final year. I'm a hard-working, reliable, and self-motivated individual who's always looking to learn new things. I can communicate effectively with a wide spectrum of people because of my strong technical and interpersonal abilities. As an IT professional, I am enthusiastic for new challenges that will allow me to grow and improve my skills.")
                                .font(.body)
                                .padding(.leading)

            }
//            Spacer()
        }
        .padding()
    }
}

struct InfoRowView: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            
            Spacer()
            
            Text(value)
                .foregroundColor(.black) // Set foreground color to black
        }
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
