//
//  UserDefatultsUtils.swift
//
//
//  Created by Marta Maquedano on 12/4/24.
//

import Foundation


/// Function that retrieves the stored object in user defaults
/// - Parameters:
///   - groupName: AppGroup Name
///   - type: Objet type (generic, although in this case the function is designed for an array of heroes)
/// - Returns: Object
public func getAllObjects<Object>(groupName: String, castTo type: Object.Type) -> Object? where Object: Decodable
{
    guard let data = UserDefaults(suiteName: groupName)?.value(forKey: "heroes") as? Data  else { return nil }
    let decoder = JSONDecoder()
    do {
        let object = try decoder.decode(type, from: data)
        return object
    } catch let decodeError{
        print("Failed to decode object:" , decodeError)
        return nil
    }
}

/// Function that save an object in user defaults
/// - Parameters:
///   - groupName: AppGroup Name
///   - object: Object to save (generic, although in this case the function is designed for an array of heroes)
public func saveAllObjects<Object>(groupName: String, _ object: Object) where Object: Encodable {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(object){
        UserDefaults(suiteName: groupName)?.setValue(encoded, forKey: "heroes")
    }
}


/// Function that update the object stored in user defaults  (generic, although in this case the function is designed for an array of heroes)
/// - Parameters:
///   - groupName: AppGroup Name
///   - hero: element to update
public func updateHero<Object>(groupName: String, hero: Object) where Object: Codable, Object: Equatable {
    var heroes = getAllObjects(groupName: groupName, castTo: [Object].self)

    if let index = heroes?.firstIndex(where: { $0 == hero }) {
        heroes?[index] = hero
    }
    saveAllObjects(groupName: groupName, heroes)
}
