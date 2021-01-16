//
//  ExploreBank.swift
//  daqui
//
//  Created by Samuel Brasileiro on 16/01/21.
//

import SwiftUI

class ExploreBank: ObservableObject{
    
    var user: Costumer?
    
    var businesses: [Business] = []
    
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    
    init(){
        
        user = Costumer(database: User.Database(name: "Samuel Brasileiro", email: "samuelbsantosn@gmail.com", phone: "+5581996490709", imgURL: "https://firebasestorage.googleapis.com/v0/b/daqui-b933d.appspot.com/o/IMG_4164.jpeg?alt=media&token=d254aee0-546f-490e-be8b-55dc4c33bad1", location: "Recife, PE", id: "1234567890"))
        
        let busses = [Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101"))]
        businesses.append(contentsOf: busses)
        
//        FirebaseHandler.readAllCollection(.businesses, dataType: [Business.Database].self){ result in
//            if case .success(let businesses) = result{
//                self.businesses.append(contentsOf: businesses.map{Business(database: $0)})
//            }
//        }
    }
    
    
}
