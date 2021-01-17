//
//  MyTrailsViewModel.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

class TrailBank: ObservableObject {
    
    @Published var trail: Trail?
    @Published var business: Business?
    @Published var missions: [Mission] = []
    
    init(id: String) {
        FirebaseHandler.readCollection(.trails, id: id, dataType: Trail.Database.self, completion: { result in
            if case .success(let trail) = result{
                let safeTrail = Trail(attributes: trail)
                self.trail = safeTrail
                self.getMissions(of: safeTrail)
                self.getBusiness(of: safeTrail)
            }
        })
    }
    
    func getMissions(of trail: Trail){
        self.missions = Mission.missions.filter {
            trail.attributes.idMissions.contains($0.attributes.id)
        }
    }
    
    func getBusiness(of trail: Trail) {
        let id = trail.attributes.idBusiness
        
        FirebaseHandler.readCollection(.businesses, id: id, dataType: Business.Database.self, completion: { result in
            if case .success(let business) = result{
                self.business = Business(database: business)
            }
        })
    }
}
