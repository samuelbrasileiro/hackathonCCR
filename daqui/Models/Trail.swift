//
//  Trail.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class Trail: ObservableObject {
    
    var attributes: Trail.Database
    
    init(attributes: Trail.Database) {
        self.attributes = attributes
    }
    
    class Database: Codable {
        var id: String
        var idBusiness: String
        var idMissions: [String]
        
        init(id: String, idBusiness: String, idMissions: [String]) {
            self.id = id
            self.idBusiness = idBusiness
            self.idMissions = idMissions
        }
    }
}
