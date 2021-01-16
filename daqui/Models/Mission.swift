//
//  Mission.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class Mission: ObservableObject {
    
    
    class Database: Codable {
        var title: String
        var description: String
        var isCompleted: Bool
        var id: String
        
        init(title: String, description: String, isCompleted: Bool, id: String) {
            self.title = title
            self.description = description
            self.isCompleted = isCompleted
            self.id = id
        }
    }
    
}
