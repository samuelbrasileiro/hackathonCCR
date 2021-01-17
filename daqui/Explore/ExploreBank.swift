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
        
        user = Costumer(database: Costumer.Database(name: "Samuel Brasileiro", email: "samuelbsantosn@gmail.com", phone: "+5581996490709", imgURL: "https://firebasestorage.googleapis.com/v0/b/daqui-b933d.appspot.com/o/IMG_4164.jpeg?alt=media&token=d254aee0-546f-490e-be8b-55dc4c33bad1", location: "Recife, PE", id: "1234567890"))
        
        FirebaseHandler.readAllCollection(.businesses, dataType: [Business.Database].self){ result in
            if case .success(let businesses) = result{
                self.businesses.append(contentsOf: businesses.map{Business(database: $0)})
            }
        }
    }
    
    
}

