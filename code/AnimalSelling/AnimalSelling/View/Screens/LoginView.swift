//
//  LoginView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Image("login")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .padding(.leading,-40)
            
            VStack(spacing: 50) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .foregroundColor(.black).bold()
                    .font(.system(size: 30))
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1058823529, blue: 0.3294117647, alpha: 1)))
                
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 50)
           Spacer()
                HStack {
                    Button(action: {
                        withAnimation {
                            isActive = true
                        }
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    .fullScreenCover(isPresented: $isActive) {
                    ContentView()
                    }
                }
                Spacer()
                .padding(.top, 50)
            }
            .padding(.top, 50)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
