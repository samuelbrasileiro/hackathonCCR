//
//  Business.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI


class Business: ObservableObject {
    
    var attributes: Business.Database
    
    @Published var image: UIImage?
    
    @Published var coverImage: UIImage?
    
    @Published var hasNewTrail: Bool = false
    
    init(database: Business.Database) {
        attributes = database
        
        getImage(url: attributes.imgURL)
        getImage(url: attributes.coverURL)
    }

    
    func getImage(url: String){
        let request = URLRequest(url: URL(string: url)!)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else{
                    return
                }
                if let image = UIImage(data: data){
                    if url == self.attributes.imgURL{
                        self.image = image
                    }
                    else if url == self.attributes.coverURL{
                        self.coverImage = image
                    }
                }
            }
        } .resume()
    }
    
    class Database: Codable {
        var description: String?
        var instagramURL: String?
        var facebookURL: String?
        var category: Business.Category
        var promotionalText: String
        var coverURL: String
        var name: String
        var email: String
        var phone: String
        var imgURL: String
        var location: String
        var id: String
        
        init(name: String, email: String, phone: String, imgURL: String, location: String, description: String?,
             instagramURL: String?, facebookURL: String?, category: Business.Category, promotionalText: String,
             coverURL: String, id: String) {
            self.description = description
            self.instagramURL = instagramURL
            self.facebookURL = facebookURL
            self.category = category
            self.promotionalText = promotionalText
            self.coverURL = coverURL
            self.name = name
            self.email = email
            self.phone = phone
            self.imgURL = imgURL
            self.location = location
            self.id = id
        }
        
    }
    
    enum Category: String, Codable {
        case food
        case fashion
        case art
    }
    
    
}
