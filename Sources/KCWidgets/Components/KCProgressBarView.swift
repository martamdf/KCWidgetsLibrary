//
//  KCProgressBarView.swift
//
//
//  Created by Marta Maquedano on 28/4/24.
//

import SwiftUI

public struct KCProgressBarView: View {
    public var health: Double
    
    public init(health: Double) {
        self.health = health
    }
    
    public var body: some View {
        ProgressView(value: Double(health)/100)
            .tint(.green)
            .scaleEffect(y:3)
    }
}

#Preview {
    KCProgressBarView(health: 50)
}
