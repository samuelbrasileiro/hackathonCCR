//
//  MyWalletBank.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI


class MyWalletBank: ObservableObject {
    
    @Published var prizes: [Prize] = []
    @Published var business: [Business] = []
    @Published var trails: [Trail] = []
    
    init() {
        FirebaseHandler.readAllCollection(.prizes, dataType: [Prize.Database].self){ result in
            if case .success(let prize) = result{
                self.prizes.append(contentsOf: prize.map{Prize(database: $0)})
            }
        }
        
        FirebaseHandler.readAllCollection(.trails, dataType: Trail.Database.self) { result in
            if case .success(let trail) = result{
                self.trails.append(Trail(attributes: trail))
            }
            
        }

        FirebaseHandler.readAllCollection(.businesses, dataType: Business.Database.self) { finalResult in
            if case .success(let business) = finalResult {
                self.business.append(Business(database: business))
            }
        }
        
    }
    
    func getBusiness(by id: String) -> Business? {
        let trail = self.trails.filter({
            $0.attributes.id == id
        }).first
        
        if let safeTrail = trail {
            return self.business.filter({
                $0.attributes.id == safeTrail.attributes.idBusiness
            }).first
        }
        
        return nil
    }
    
}
