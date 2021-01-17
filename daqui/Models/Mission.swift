//
//  Mission.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import UIKit


class Mission: ObservableObject {
    
    var attributes: Mission.Database
    @Published var category: Category?
    @Published var categoryImage: UIImage?
    
    init(attributes: Mission.Database) {
        self.attributes = attributes
        self.getCategory()
    }
    
    func getImage(url: String){
        let request = URLRequest(url: URL(string: url)!)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else{
                    return
                }
                if let image = UIImage(data: data){
                    self.categoryImage = image
                }
            }
        } .resume()
    }
    
    func getCategory() {
        FirebaseHandler.readCollection(.categories, id: self.attributes.idCategory, dataType: Category.Database.self, completion: { result in
            if case .success(let category) = result{
                self.category = Category(attributes: category)
                self.getImage(url: self.category!.attributes.iconURL)
            }
        })
    }
    
    class Database: Codable {
        var title: String
        var description: String
        var isCompleted: Bool
        var id: String
        var idCategory: String
        
        init(title: String, description: String, isCompleted: Bool, id: String, idCategory: String) {
            self.title = title
            self.description = description
            self.isCompleted = isCompleted
            self.id = id
            self.idCategory = idCategory
        }
    }
    
}
