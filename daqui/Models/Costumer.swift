//
//  Costumer.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI


class Costumer: ObservableObject {
    
    var attributes: Costumer.Database
    
    @Published var image: UIImage?
    
    init(database: Costumer.Database) {
        attributes = database
        getImage()
    }
    
    func getImage(){
        let request = URLRequest(url: URL(string: attributes.imgURL)!)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else{
                    return
                }
                if let image = UIImage(data: data){
                    self.image = image
                }
            }
        } .resume()
    }
    
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
