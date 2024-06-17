//
//  HomeView.swift
//  AnimalSelling
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    

    var body: some View {
        VStack{
            NavigationView {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 30))
                            .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1058823529, blue: 0.3294117647, alpha: 1)))
                        Spacer()
                    }
                    .padding(.top, -20)
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                    Text("Adopt your favorite Animal")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1058823529, blue: 0.3294117647, alpha: 1)))
                    
                    HStack {
                        SearchBar(searchText: $searchText, isSearching: $isSearching)
                        .padding(.leading, -15)
                        .padding(.trailing, -15)
                                           
                         Spacer()
                       }
                    
                    VStack{
                        Text("Categories")
                            .font(.system(size: 25, weight: .bold))
                            .padding(.top, 18)
                            .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1058823529, blue: 0.3294117647, alpha: 1)))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        ScrollView(.horizontal){
                            HStack(spacing: 15){
                                ScrollViewBtn(icon: "dog1", text: "Dogs") {
                                }
                                ScrollViewBtn(icon: "cat",text: "Cats") {
                                }
                                ScrollViewBtn(icon: "bird", text: "Birds") {
                                }
                             }
                            .padding(.top, 20)
                        }           
                        .scrollIndicators(.hidden)
                    }

                    VStack (alignment: .leading){
                        Text("Popular")
                            .font(.system(size: 25, weight: .bold))
                            .padding(.top, 20)
                            .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1058823529, blue: 0.3294117647, alpha: 1)))
                    }
                    Spacer()
                    List{
                   
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 4) {
                        CardView(imageName: "dognew", title: "Labrador", description: "Rs. 25000.00")
                        .frame(width: UIScreen.main.bounds.width - 250)
                       
                        CardView(imageName: "persian", title: "Persian", description: "Rs. 44000.00")
                        .frame(width: UIScreen.main.bounds.width - 250)
                        
                        CardView(imageName: "dog11", title: "Golden", description: "Rs. 22000.00")
                        .frame(width: UIScreen.main.bounds.width - 250)
                       
                        CardView(imageName: "persian1", title: "Persian", description: "Rs. 65000.00")
                        .frame(width: UIScreen.main.bounds.width - 250)
                           Spacer()
                          .padding()
                        }
                          .padding(.horizontal, 4)
                      }
                          .scrollIndicators(.hidden)
                          .listStyle(PlainListStyle())
                }
                .padding()
            }
          }
        }
    }

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.leading, 10)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    isSearching = true
                }

            if isSearching {
                Button(action: {
                    searchText = ""
                    isSearching = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .padding(.horizontal, 8)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CardView: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .padding(.leading, -53)
    
            Text(description)
                .font(.body)
                .padding(.top, -10)
                .padding(.bottom, 10)
                .font(.system(size: 18, weight: .bold))
       

        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}





