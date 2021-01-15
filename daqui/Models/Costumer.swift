//
//  Costumer.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class Costumer: User, ObservableObject {
    
    var attributes: Costumer.Database
    
    init(database: Costumer.Database) {
        attributes = database
    }

}
