//
//  MyTrailsViewModel.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

class MyTrailsBank: ObservableObject {
    
    @Published var trails: [Trail] = []
    @Published var business: [Business] = []
    
    init() {
        FirebaseHandler.readAllCollection(.trails, dataType: [Trail.Database].self){ result in
            if case .success(let trails) = result{
                self.trails.append(contentsOf: trails.map{Trail(attributes: $0)})
            }
        }

        FirebaseHandler.readAllCollection(.businesses, dataType: [Business.Database].self){ result in
            if case .success(let business) = result{
                self.business.append(contentsOf: business.map{Business(database: $0)})
            }
        }
    }
    
    func getBusiness(by id: String) -> [Business] {
        business.filter({
            $0.attributes.id == id
        })
    }
}
