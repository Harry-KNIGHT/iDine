//
//  Favorites.swift
//  iDine
//
//  Created by Elliot Knight on 27/01/2022.
//

import Foundation


class Favorites: ObservableObject {
    private var favorites: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        
        ressort = []
    }
}
