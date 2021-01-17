//
//  Mission.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import UIKit


class Mission: ObservableObject {
    
    var attributes: Mission.Database
    @Published var categoryImage: UIImage?
    
    init(attributes: Mission.Database) {
        self.attributes = attributes
        self.getImage(url: self.attributes.imgURL)
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
    
    class Database: Codable {
        var title: String
        var description: String
        var isCompleted: Bool
        var id: String
        var imgURL: String
        
        init(title: String, description: String, isCompleted: Bool, id: String, imgURL: String) {
            self.title = title
            self.description = description
            self.isCompleted = isCompleted
            self.id = id
            self.imgURL = imgURL
        }
    }
    
    static var missions: [Mission] = [
        Mission.Database(title: "Divulgação no Whatsapp", description: "O cliente irá compartilhar informações do seu negócio com contatos de seu whatsapp", isCompleted: false, id: "0", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800383822218526760/Divulgacao.png"),
        Mission.Database(title: "Compra antecipada", description: "Aqui você vai gerar capital de giro para seu negócio, através da venda de cupons", isCompleted: false, id: "1", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800383828296335420/Antecipada.png"),
        Mission.Database(title: "Post nos Stories", description: "O cliente irá publicar um stories no instagram divulgando sua marca ou produto", isCompleted: false, id: "2", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800383826974474270/Publicidade.png"),
        Mission.Database(title: "Pesquisa de mercado", description: "Através de uma enquete, você poderá testar tendências de mercado com o seu público", isCompleted: false, id: "3", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800368599755784212/MarkeIcon.png"),
        Mission.Database(title: "Feedback do cliente", description: "Aqui você disponibiliza uma caixa de texto para o cliente compartilhar a sua experiência ou opinião!", isCompleted: false, id: "4", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800383824822796298/Feedback.png"),
        Mission.Database(title: "Publicação no Facebook", description: "O cliente irá compartilhar a página do seu negócio no Facebook", isCompleted: false, id: "5", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800386518010298418/facebook.png")
    ].map{Mission(attributes: $0)}
    
}
