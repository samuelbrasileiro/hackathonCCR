//
//  Trail.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class Trail: ObservableObject {
    
    var attributes: Trail.Database
    
    @Published var business: Business?
    
    init(attributes: Trail.Database) {
        self.attributes = attributes
        
        FirebaseHandler.readCollection(.businesses, id: attributes.idBusiness, dataType: Business.Database.self){ result in
            if case .success(let database) = result{
                self.business = Business(database: database)
            }
        }
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
