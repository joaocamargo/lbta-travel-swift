//
//  CategoryDetailsView.swift
//  LBTA_Travel
//
//  Created by joao camargo on 04/11/21.
//

import SwiftUI

import SDWebImageSwiftUI
import Kingfisher


class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage =  ""
    
    
    init(){
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                    self.places = self.places

                } catch {
                    print("failed to decode, \(error)")
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }.resume()
    }
}


struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
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
                ZStack {
                    Text(vm.errorMessage)
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0){
                                //KFImage(URL(string: place.thumbnail)).resizable().scaledToFill()
                                WebImage(url: URL(string: place.thumbnail)).resizable().scaledToFill()
                                Text(place.name).font(.system(size:12, weight: .semibold))
                                    .padding()
                            }.asTile()
                                .padding()
                        }
                    }
                }
            }
        }.navigationBarTitle("category", displayMode: .inline)

    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
    }
}
