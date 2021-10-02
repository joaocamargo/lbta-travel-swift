//
//  ContentView.swift
//  LBTA_Travel
//
//  Created by joao camargo on 02/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 8){
                        ForEach(0..<9, id: \.self) { num in
                            VStack(spacing: 4) {
                                Spacer()
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray)
                                    .cornerRadius(.infinity)
                                    .shadow(color: .gray, radius: 4, x: 0, y: 2)
                                Text("Art")
                                    .font(.system(size: 12, weight: .semibold))
                            }
                        }
                    }.padding(.horizontal)
                }
            }.navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
