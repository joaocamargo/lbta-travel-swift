//
//  DiscoverCategoriesView.swift
//  LBTA_Travel
//
//  Created by joao camargo on 27/10/21.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
        
    ]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .top, spacing: 14){
                ForEach(categories, id: \.self) { category in
                    NavigationLink(destination: CategoryDetailsView(categoryName: category.name), label: {
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

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Int]()
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
            self.places = [1,2]
            
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    
    
}

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    @State var categoryName: String
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack{
                    ActivityIndicatorView()
                    Text("Loading...").foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }.padding().background(Color.black)
                    .cornerRadius(8)
            } else {
                ScrollView {
                    ForEach(vm.places, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 0){
                            Image("art\(num)").resizable().scaledToFill()
                            Text("Content").font(.system(size:12, weight: .semibold))
                                .padding()
                        }.asTile()
                            .padding()
                    }
                }
            }
        }.navigationBarTitle(categoryName, displayMode: .inline)

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
