//
//  MyWalletBank.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI


class MyWalletBank: ObservableObject {
    
    @Published var prizes: [Prize] = []
    
    init() {
        FirebaseHandler.readAllCollection(.prizes, dataType: [Prize.Database].self){ result in
            if case .success(let prizes) = result{
                for prize in prizes{
                    print(prize.id)
                }
                self.prizes.append(contentsOf: prizes.map{Prize(database: $0)})
            }
        }

        
    }
    
}
