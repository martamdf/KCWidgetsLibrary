//
//  File.swift
//  
//
//  Created by Marta Maquedano on 10/4/24.
//

import SwiftUI

public struct Avatar: View {
    var photo: String
    
    public init(photo: String) {
        self.photo = photo
    }
    
    public var body: some View {
        ZStack{
            Image(photo)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 50, height:50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(
                    Circle()
                        .stroke(Color.orange, lineWidth: 4)
                )
        }
    }
}
