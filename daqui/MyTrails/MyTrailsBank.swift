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
    var missions: [Mission] = []
    
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
        
        FirebaseHandler.readAllCollection(.missions, dataType: [Mission.Database].self){ result in
            if case .success(let mission) = result{
                self.missions.append(contentsOf: mission.map{Mission(attributes: $0)})
            }
        }
    }
    
    func getBusiness(by id: String) -> [Business] {
        business.filter({
            $0.attributes.id == id
        })
    }
    
    func getTrailCompletion(by id: String) -> Float {
        let trail = trails.filter({ $0.attributes.id == id }).first!
        var trailMission: [Mission] = []
        var missionsCompleted = 0
        
        for missionID in trail.attributes.idMissions {
            
            if let mission = missions.filter({ return $0.attributes.id == missionID }).first {
                trailMission.append(mission)
            }
        }
        
        for mission in trailMission {
            missionsCompleted += mission.attributes.isCompleted ? 1 : 0
        }
        
        let percentual = Float(missionsCompleted/trailMission.count) * 100
        
        return percentual
    }
}
