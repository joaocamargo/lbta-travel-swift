//
//  DiscoverCategoriesView.swift
//  LBTA_Travel
//
//  Created by joao camargo on 27/10/21.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    let build: () -> T
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    var body:  T {
        build()
    }
}

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "art", imageName: "paintpalette.fill"),
        .init(name: "sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
        
    ]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .top, spacing: 14){
                ForEach(categories, id: \.self) { category in
                    NavigationLink(destination: NavigationLazyView(CategoryDetailsView(name: category.name)), label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(Color.orange)
                                .frame(width: 64, height: 64)
                                .background((Color.white))
                                .cornerRadius(64)
                            //  .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }.frame(width: 68)
                    })
                }
            }.padding(.horizontal)
        }
    }
}


struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
        /*ZStack {
         Color.orange
         DiscoverCategoriesView()
         }*/
        
        NavigationView {
            NavigationLink(destination: Text("Destination"),
                           label: { Text("Link")
                
            })
        }
    }
}
