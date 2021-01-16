//
//  Business.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class Business: User, ObservableObject {
    
    var attributes: Costumer.Database
    
    init(database: Costumer.Database) {
        attributes = database
    }
    
    class Database: User.Database{
        var description: String
        var instagramURL: String?
        var facebookURL: String?
        var category: Business.Category
        var promotionalText: String
        
        
        init(name: String, email: String, phone: String, imgURL: String, location: String, description: String,
             instagramURL: String?, facebookURL: String?, category: Business.Category, promotionalText: String, id: String) {
            self.description = description
            self.instagramURL = instagramURL
            self.facebookURL = facebookURL
            self.category = category
            self.promotionalText = promotionalText
            super.init(name: name, email: email, phone: phone, imgURL: imgURL, location: location, id: id)
        }
        
        required init(from decoder: Decoder) throws {
            fatalError("init(from:) has not been implemented")
        }
    }
    
    enum Category: String, Codable {
        case food
        case fashion
        case art
    }
    
    
}
