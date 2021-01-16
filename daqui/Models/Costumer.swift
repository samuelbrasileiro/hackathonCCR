//
//  Costumer.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI


class Costumer: User, ObservableObject {
    
    var attributes: Costumer.Database
    
    @Published var image: UIImage?
    
    init(database: Costumer.Database) {
        attributes = database
        super.init()
        
        
    }
    
    func commonInit(){
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
    
}
