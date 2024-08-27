//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Mac on 23/03/2024.
//

import Foundation


class Favorites : ObservableObject {
    
    var ids =  Set<String>()
    
    
    init() {
        load()
    }
    
    func save() {
        let defaults = UserDefaults.standard
        if let data = try? JSONEncoder().encode(ids)  {
            defaults.setValue(data, forKey: "Favorites")
        }
       
    }
    
    func load() {
        let defaults = UserDefaults.standard
        if let data =  defaults.data(forKey: "Favorites"), let savedIds = try? JSONDecoder().decode(Set<String>.self, from: data) {
            ids = savedIds
        }
    }
    
    func add(_ resortId: String) {
        objectWillChange.send()
        ids.insert(resortId)
        save()
    }
    
    func remove(_ resortId: String) {
        objectWillChange.send()
        ids.remove(resortId)
        save()
    }
    
    func contains(_ resortId: String) -> Bool {
        ids.contains(resortId)
    }
}
