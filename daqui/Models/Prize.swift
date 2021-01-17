//
//  Prize.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation

class Prize: Identifiable, ObservableObject {
    
    var attributes: Prize.Database
    
    init(database: Prize.Database) {
        attributes = database
    }
    
    class Database: Codable {
        var discount: String
        var amount: String
        var product: String
        var id: String
        var idTrail: String
        
        init(discount: String, amount: String, product: String, id: String, idTrail: String) {
            self.discount = discount
            self.amount = amount
            self.product = product
            self.id = id
            self.idTrail = idTrail
        }
    }
    
}
