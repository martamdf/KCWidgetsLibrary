//
//  File.swift
//
//
//  Created by Marta Maquedano on 10/4/24.
//

import SwiftUI

public struct NameView: View {
    let name: String
    let isFav: Bool
    
    public init(name: String, isFav: Bool = false) {
        self.name = name
        self.isFav = isFav
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .minimumScaleFactor(0.25)
            HStack{
                Text("10 XP")
                    .minimumScaleFactor(0.5)
                FavHeart(isFavourite: isFav)
            }
        }
        .padding(.leading, 10)
    }
}

