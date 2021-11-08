//
//  PopularDestinationsView.swift
//  LBTA_Travel
//
//  Created by joao camargo on 27/10/21.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "USA", imageName: "new_york")
    ]
    
    var body: some View {
        VStack{
            HStack {
                Text("Popular Destinations").font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all").font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(destinations, id: \.self) { destination in
                        NavigationLink {
                            PopularDestinationDetailsView(destination: destination)
                        } label: {
                            PopularDestinationTile(destination: destination)
                                .padding(.bottom)
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
    
}

struct PopularDestinationDetailsView: View {
    
    let destination: Destination
    
    var starRandom = [0,1,2,3,4].shuffled().first!
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
               // .frame(height: 200) // no dele fica estranho e ele precisa por a altura
                //.clipped()
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<starRandom, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                    ForEach(0..<5-starRandom, id: \.self) { num in
                        Image(systemName: "star")
                            .foregroundColor(.orange)
                    }
                }.padding(.top,2)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ante dolor, facilisis at purus in, malesuada suscipit risus. Maecenas tristique mauris viverra ipsum lobortis faucibus. Quisque condimentum nisl ex, sit amet interdum sem molestie id. Morbi commodo feugiat quam pellentesque imperdiet. Cras rutrum, tortor nec euismod porta, nisl arcu fermentum arcu, in tincidunt eros orci sit amet nisi. Maecenas vitae cursus quam. Fusce suscipit facilisis leo sit amet feugiat. Curabitur vulputate tortor ac mi maximus, sed ornare lorem tincidunt. Mauris tincidunt sapien id purus bibendum tincidunt. Cras hendrerit velit nulla, vel viverra enim sollicitudin non. Fusce ut pretium nisi, et feugiat elit.")
                    .padding(.top,12)
                
                HStack{
                    Spacer()
                }
            }
                .padding(.horizontal)
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
}

struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(4)
                .padding(.horizontal,6)
                .padding(.vertical,6)
            
            Text(destination.name).font(.system(size: 12, weight: .semibold)).padding(.horizontal, 12).foregroundColor(Color(.label))
            Text(destination.country).font(.system(size: 12, weight: .semibold)).padding(.horizontal, 12).padding(.bottom,8).foregroundColor(.gray)
        }
        .asTile()
    }
}


struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower"))
        }
        PopularDestinationsView()
        DiscoverView()
    }
}
