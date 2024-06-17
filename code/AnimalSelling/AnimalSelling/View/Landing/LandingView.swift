//
//  LandingView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI

struct LandingView: View {
    @State private var isActive = false
    @State private var showingTextView = false
    
    var body: some View {
        ZStack {
            
            // Background Image
            Image("landingPage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .padding(.leading,-40)
            
            VStack{
                Spacer()
                Button(action: {
                        withAnimation {
                            isActive = true
                        }
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    .fullScreenCover(isPresented: $isActive) {
                        LoginView()
                     Spacer()
                    }
            }
        }
    
        .statusBar(hidden: true)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
