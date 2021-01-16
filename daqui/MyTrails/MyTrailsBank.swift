//
//  MyTrailsViewModel.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

class MyTrailsBank: ObservableObject {
    
    @Published var trails: [Trail]
    @Published var business: Business
    
    init() {
        
        let trail = Trail(attributes: Trail.Database(id: "1", idBusiness: "-MRBDZkWjH4WrM-rBwGI"))
        
        FirebaseHandler.writeToCollection(.trails, value: trail.attributes)
        FirebaseHandler.writeToCollection(.trails, value: trail.attributes)
        FirebaseHandler.writeToCollection(.trails, value: trail.attributes)
        
        
//        FirebaseHandler.readAllCollection(.trails, dataType: [Trail.Database].self){ result in
//            if case .success(let trails) = result{
//                self.trails.append(contentsOf: trails.map{Trail(attributes: $0)})
//            }
//        }
    }
    
    func getBusiness(by id: String) -> Business? {
        FirebaseHandler.readCollection(.businesses, id: id, dataType: Business.Database.self) { result in
            if case .success(let business) = result{
                self.business = Business(database: business)
            }
        }

        return nil
    }
}
