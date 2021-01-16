//
//  Prize.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation

class Prize: ObservableObject {
    
    
    class Database: Codable, Identifiable {
        var discount: String
        var amount: String
        var product: String
        var id: String
        
        
        init(discount: String, amount: String, product: String, id: String) {
            self.discount = discount
            self.amount = amount
            self.product = product
            self.id = id
        }
    }
    
}
