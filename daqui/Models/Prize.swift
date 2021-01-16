//
//  Prize.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation

class Prize: ObservableObject {
    
    
    class Database: Codable {
        var description: String
        var title: String
        var id: String
        
        
        init(description: String, title: String, id: String) {
            self.description = description
            self.title = title
            self.id = id
        }
    }
    
}
