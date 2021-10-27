//
//  ContentView.swift
//  LBTA_Travel
//
//  Created by joao camargo on 02/10/21.
//

import SwiftUI

struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.orange, Color(red: 160, green: 0, blue: 0)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                Color(.init(white: 0.95, alpha: 1)).offset(y: 400)
                
                ScrollView{
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?").font(.system(size: 14, weight: .semibold))
                        Spacer()
                    }.foregroundColor(.white)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(10)
                        .padding(16)
                    
                    DiscoverCategoriesView()
                    
                    VStack {
                    
                        PopularDestinationsView()
                    
                        PopularRestaurantsView()
                    
                        TrendingCreatorsView()
                        
                    }.background(Color(.init(white: 0.95, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top,32)
                    .foregroundColor(.black)
                    
                }.navigationTitle("Discover")
            }
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .preferredColorScheme(.dark)
    }
}


