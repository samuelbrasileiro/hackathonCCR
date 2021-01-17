//
//  ExploreBank.swift
//  daqui
//
//  Created by Samuel Brasileiro on 16/01/21.
//

import SwiftUI

class ExploreBank: ObservableObject{
    
    var user: Costumer?
    
    @Published var businesses: [Business] = []
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    
    init(){
         FirebaseHandler.readAllCollection(.businesses, dataType: [Business.Database].self){ result in
             if case .success(let businesses) = result{
                 self.businesses.append(contentsOf: businesses.map{Business(database: $0)})
             }
         }
        
        user = Costumer(database: Costumer.Database(name: "Samuel Brasileiro", email: "samuelbsantosn@gmail.com", phone: "+5581996490709", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800482129142218812/LO1.png", location: "Jordão-Baixo Recife, PE", id: "1234567890"))
        
        
//        businesses = [Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé\nO nome não importa, o que importa é o sabor! e nisso a gente se garante :)\nDudu do Bom!\nO seu sorvete no saquinho, o dudu gourmet mais delicioso da região.", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé\nO nome não importa, o que importa é o sabor! e nisso a gente se garante :)\nDudu do Bom!\nO seu sorvete no saquinho, o dudu gourmet mais delicioso da região.", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé\nO nome não importa, o que importa é o sabor! e nisso a gente se garante :)\nDudu do Bom!\nO seu sorvete no saquinho, o dudu gourmet mais delicioso da região.", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé\nO nome não importa, o que importa é o sabor! e nisso a gente se garante :)\nDudu do Bom!\nO seu sorvete no saquinho, o dudu gourmet mais delicioso da região.", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé\nO nome não importa, o que importa é o sabor! e nisso a gente se garante :)\nDudu do Bom!\nO seu sorvete no saquinho, o dudu gourmet mais delicioso da região.", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101"))]
        
//        businesses[1].hasNewTrail = true
    }
    
    
}

