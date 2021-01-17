//
//  Category.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation

class Category: ObservableObject {
    
    var attributes: Category.Database
    
    init(attributes: Category.Database){
        self.attributes = attributes
    }
    
    class Database: Codable {
        var iconURL: String
        var color: String
        var id: String
        
        init(iconURL: String, color: String, id: String) {
            self.iconURL = iconURL
            self.color = color
            self.id = id
        }
    }
    
}
