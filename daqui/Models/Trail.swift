//
//  Trail.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class Trail: ObservableObject {
    
    
    class Database: Codable {
        var id: String
        
        init(id: String) {
            self.id = id
        }
    }
}
