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
    
    init(name: String){
        
        let urlstring = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())"
                                                    .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlstring ) else {
            self.isLoading = false
            return
        }
        
        print(url)
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let statusCode = (resp as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                self.isLoading = false
                self.errorMessage = "Bad status: \(statusCode)"
                return
            }
            
            
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
    
      
    private let name: String
    @ObservedObject var vm: CategoryDetailsViewModel
    
    init(name: String) {
        self.name = name
        self.vm =  CategoryDetailsViewModel(name: name)
    }
    
     
    
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
                    
                    if !vm.errorMessage.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "xmark.octagon.fill").font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                        }
                    }
                    
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
        }.navigationBarTitle(self.name, displayMode: .inline)

    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView(name: "art")
        }
    }
}
