//
//  File.swift
//  
//
//  Created by Marta Maquedano on 12/4/24.
//

import Foundation


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


public func saveAllObjects<Object>(_ object: Object) where Object: Encodable {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(object){
        UserDefaults(suiteName: "group.DragonBallWidgetKC")?.setValue(encoded, forKey: "heroes")
    }
}
