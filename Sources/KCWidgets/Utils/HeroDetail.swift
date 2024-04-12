//
//  File.swift
//  
//
//  Created by Marta Maquedano on 12/4/24.
//

import Foundation
import SwiftUI

public class HeroDetail: Identifiable, Codable {
    let name: String
    let photo: String
    var healthLevel: Int
    let bio: String
    var favorite: Bool
    var isHealing: Bool = false

    var startHealingDate: Date = Date()

    init(name: String, avatar: String, healthLevel: Int, bio: String, favorite: Bool) {
        self.name = name
        self.photo = avatar
        self.healthLevel = healthLevel
        self.bio = bio
        self.favorite = favorite
    }
}
