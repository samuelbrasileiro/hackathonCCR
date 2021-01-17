//
//  Trail.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import Foundation


class Trail: ObservableObject {
    
    var attributes: Trail.Database
    
    @Published var missions: [Mission] = []
    @Published var business: Business?
    
    class func create(missions: [Bool], discount: String, product: String) {
        let includedMissionsIndexes = (0..<missions.count).filter{missions[$0]}.map{String($0)}
        
        let trail = Trail.Database(id: "", idBusiness: "-MRBDZkWjH4WrM-rBwGI", idMissions: includedMissionsIndexes)
        let trailID = FirebaseHandler.writeToCollection2(.trails, value: trail)
        
        if let safeTrailID = trailID {
            let prize = Prize(database: Prize.Database(discount: discount, amount: "", product: product, id: "", idTrail: safeTrailID))
            FirebaseHandler.writeToCollection(.prizes, value: prize.attributes)
        }
    }
  
    init(attributes: Trail.Database) {
        self.attributes = attributes
        getMissions()
        FirebaseHandler.readCollection(.businesses, id: attributes.idBusiness, dataType: Business.Database.self){ result in
            if case .success(let database) = result{
                self.business = Business(database: database)
            }
        }
    }
    
    func getMissions(){

        self.missions = Mission.missions.filter {
            self.attributes.idMissions.contains($0.attributes.id)
        }
        print(missions.count)
    }
    
    class Database: Codable {
        var id: String
        var idBusiness: String
        var idMissions: [String]
        
        init(id: String, idBusiness: String, idMissions: [String]) {
            self.id = id
            self.idBusiness = idBusiness
            self.idMissions = idMissions
        }
    }
    
    
}
