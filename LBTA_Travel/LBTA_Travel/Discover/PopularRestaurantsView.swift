//
//  PopularRestaurantsView.swift
//  LBTA_Travel
//
//  Created by joao camargo on 27/10/21.
//

import SwiftUI

struct PopularRestaurantsView: View {
    var body: some View {
        let restaurants: [Restaurant] = [
            .init(name: "Japan's Finest Tapas", imageName: "tapas"),
            .init(name: "Bar & Grill", imageName: "bar_grill")
        ]
        
            VStack{
                HStack {
                    Text("Popular places to eat").font(.system(size: 14, weight: .semibold))
                    Spacer()
                    Text("See all").font(.system(size: 12, weight: .semibold))
                }.padding(.horizontal)
                    .padding(.top)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(restaurants, id: \.self) { resturant in
                            HStack(spacing: 8) {
                                Image(resturant.imageName).resizable().scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .cornerRadius(5)
                                    .padding(.leading,6)
                                    .padding(.vertical,6)
                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Text(resturant.name)
                                        Spacer()
                                        Button(action: {}, label: { Image(systemName: "ellipsis").foregroundColor(.gray) })
                                    }
                                    
                                    HStack{
                                        Image(systemName: "star.fill")
                                        Text("4.7 • Sushi • $$")
                                    }
                                   
                                    
                                    Text("Tokyo, Japan")
                                        
                                }
                                .foregroundColor(.black)
                                .font(.system(size:12, weight: .semibold))
                                
                                Spacer()
                            }
                            .frame(width: 240)
                            .background(Color.white)
                                .cornerRadius(5)
                                .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0, y: 2)
                                .padding(.bottom)
                        }
                    }.padding(.horizontal)
                }
            }
        }
    
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        DiscoverView()
    }
}
