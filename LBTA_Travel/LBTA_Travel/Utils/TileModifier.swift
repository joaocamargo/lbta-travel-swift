//
//  TileModifier.swift
//  LBTA_Travel
//
//  Created by joao camargo on 31/10/21.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}


struct TileModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        return content.background(Color.white) // Color(.init(white: 0.7, alpha: 1)))
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0, y: 2)
    }
    
    
}
