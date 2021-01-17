//
//  SettingsBank.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI



class SettingsBank: ObservableObject {
    @Published var costumer: Costumer
    
    init() {
        self.costumer = Costumer(database: Costumer.Database(name: "Samuel Brasileiro", email: "samuelbsantosn@gmail.com", phone: "81996490709", imgURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", location: "Ilha de Deus, Recife", id: "1"))
    }
    
}
