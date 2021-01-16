//
//  MyWalletBank.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI


class MyWalletBank: ObservableObject {
    
    @Published var prizes: [Prize.Database]
    
    init() {
        self.prizes = [
            Prize.Database(discount: "50%", amount: "a partir de 10 unidades", product: "em Gelinho Gourmet do TUTU", id: "1"),
            Prize.Database(discount: "50%", amount: "a partir de 10 unidades", product: "em Gelinho Gourmet do TUTU", id: "2"),
            Prize.Database(discount: "50%", amount: "a partir de 10 unidades", product: "em Gelinho Gourmet do TUTU", id: "3"),
        ]
    }
}
