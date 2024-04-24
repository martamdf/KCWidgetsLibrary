//
//  File.swift
//  
//
//  Created by Marta Maquedano on 10/4/24.
//

import SwiftUI

public struct MyButtonStyle: ButtonStyle {
    
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .foregroundColor(.white)
            .frame(width: 100, height: 50, alignment: .center)
            .background(configuration.isPressed ? Color.red : Color.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
    }
}
