//
//  File.swift
//  
//
//  Created by Marta Maquedano on 10/4/24.
//

import SwiftUI

public struct FavHeart: View {
    public var isFavourite: Bool
    
    public init(isFavourite: Bool) {
        self.isFavourite = isFavourite
    }
    
    public var body: some View{
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
