//
//  File.swift
//  
//
//  Created by Marta Maquedano on 12/4/24.
//

import Foundation


public func getAllObjects() -> [HeroDetail] {
    let defaultObject: [HeroDetail] = []
    if let objects = UserDefaults(suiteName: "group.DragonBallWidgetKC")?.value(forKey: "heroes") as? Data {
        let decoder = JSONDecoder()
        if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [HeroDetail] {
            return objectsDecoded
        } else {
            return defaultObject
        }
    } else {
        return defaultObject
    }
}

public func saveAllObjects(heroes: [HeroDetail]) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(heroes){
        UserDefaults(suiteName: "group.DragonBallWidgetKC")?.setValue(encoded, forKey: "heroes")
    }
}

public func getHero(name: String) -> HeroDetail {
    let defaultObject = goku
    if let objects = UserDefaults(suiteName: "group.DragonBallWidgetKC")?.value(forKey: "heroes") as? Data {
        let decoder = JSONDecoder()
        if let objectsDecoded =
            try? decoder.decode(Array.self, from: objects) as [HeroDetail] {
            if let hero = objectsDecoded.first(where: {$0.name == name}) {
                return hero
            }
        }
    }
    return defaultObject
}

public func updateHero(_ hero: HeroDetail) {
    var heroes = getAllObjects()
    if let row = heroes.firstIndex(where: {$0.name == hero.name}) {
        heroes[row] = hero
    }
    saveAllObjects(heroes: heroes)
}

public let goku = HeroDetail(
    name: "Goku",
    avatar: "GokuAvatar",
    healthLevel: 14,
    bio: "Test",
    favorite: true)
