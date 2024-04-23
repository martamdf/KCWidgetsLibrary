//
//  UserDefatultsUtils.swift
//
//
//  Created by Marta Maquedano on 12/4/24.
//

import Foundation


/// Retrieves a stored object from UserDefaults.
/// This function is generic and primarily designed to work with an array of objects that conform to `Decodable`. It is particularly tailored for handling an array of heroes but can be used with any decodable array.
///
/// - Parameters:
///   - groupName: The optional name of the UserDefaults app group. If nil, the function uses `UserDefaults.standard`.
///     This parameter allows the function to access specific shared containers or the main application's UserDefaults.
///   - forKey: The key under which the object is stored in UserDefaults.
///   - type: The type of the object to retrieve. The object type must conform to `Decodable` to be eligible for decoding.
///
/// - Returns: The object of the specified type if it exists and can be successfully decoded; otherwise, nil.
///
public func getAllHeroes<Object>(groupName: String? = nil, forKey: String, castTo type: Object.Type) -> Object? where Object: Decodable {
    let userDefaults = groupName != nil ? UserDefaults(suiteName: groupName!) : UserDefaults.standard
    
    guard let data = userDefaults?.value(forKey: "heroes") as? Data else { return nil }
    let decoder = JSONDecoder()
    do {
        let object = try decoder.decode(type, from: data)
        return object
    } catch let decodeError {
        print("Failed to decode object:", decodeError)
        return nil
    }
}


/// Saves a specified object to UserDefaults, encoding it as JSON.
/// This function is generic and primarily designed for storing objects that conform to the `Encodable` protocol, making it suitable for an array of heroes or any other encodable object.
///
/// - Parameters:
///   - groupName: Optional name of the UserDefaults app group. If nil, `UserDefaults.standard` is used.
///     This allows the function to target specific shared containers or the default app's UserDefaults.
///   - forKey: The key under which the object will be stored. It is crucial that the key is unique within the specified UserDefaults group to avoid overwriting other data.
///   - object: The object to save. It must conform to the `Encodable` protocol, which enables it to be serialized into JSON format.
///
/// Note: If the encoding process fails or there is an issue with UserDefaults, the function does not save the object and fails silently. It is advisable to handle potential errors or add logging to monitor such cases.
public func saveAllHeroes<Object>(groupName: String? = nil, forKey: String, _ object: Object) where Object: Encodable {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(object) {
        let userDefaults = groupName != nil ? UserDefaults(suiteName: groupName!) : UserDefaults.standard
        userDefaults?.setValue(encoded, forKey: forKey)
    }
}


/// Updates an existing hero or adds a new hero to the specified UserDefaults storage.
/// This function is designed to handle arrays of objects that conform to both `Codable` and `Equatable`, allowing it to efficiently check for and update existing entries or append new ones.
///
/// - Parameters:
///   - groupName: Optional app group name. If nil, `UserDefaults.standard` will be used. This allows the function to target specific app group user defaults or default to the main app's user defaults based on the specified group.
///   - hero: The hero object to update or add. If the hero already exists in the array, it will be updated; if it does not, it will be added.
public func updateHero<Object>(groupName: String? = nil, key: String, hero: Object) where Object: Codable, Object: Equatable {
    var heroes = getAllHeroes(groupName: groupName, forKey: key, castTo: [Object].self)
    
    if let index = heroes?.firstIndex(where: { $0 == hero }) {
        heroes?[index] = hero
    } else {
        // Si el héroe no está en la lista, lo añadimos.
        heroes?.append(hero)
    }

    saveAllHeroes(groupName: groupName, forKey: key, heroes ?? [])
}
