//
//  File.swift
//  
//
//  Created by Marta Maquedano on 10/4/24.
//

import SwiftUI

struct FavHeart: View {
    var isFavourite: Bool
    
    public init(isFavourite: Bool) {
        self.isFavourite = isFavourite
    }
    
    var body: some View{
        if isFavourite {
            Image(systemName: "heart.circle")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 20, height: 20)
            
        } else {
            Image(systemName: "heart.circle")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 20, height: 20)
        }
    }
}
