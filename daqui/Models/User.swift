//
//  User.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class User {
    
    class Database: Codable {
        var name: String
        var email: String
        var phone: String
        var imgURL: String
        var location: String
        var id: String
        
        init(name: String, email: String, phone: String, imgURL: String, location: String, id: String) {
            self.name = name
            self.email = email
            self.phone = phone
            self.imgURL = imgURL
            self.location = location
            self.id = id
        }
    }
    
    
}
