//
//  TrailView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct TrailView: View {
    
    @ObservedObject var trail: Trail
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text("Trilha de 50% de desconto")
                        .font(.largeTitle)
                        .bold()
                    
                    if let business = trail.business {
                        Text("Por \(business.attributes.name)")
                            .font(.callout)
                    } else {
                        Text("Por Empresa não nomeada")
                            .font(.callout)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                
                Spacer()
            }

            VStack {
                ForEach(0..<trail.missions.count, id: \.self) { index in
                    let last = index == trail.missions.count - 1
                    
                    if index % 2 == 0 {
                        LeftSideTrailView(last: last, mission: trail.missions[index])
                    } else {
                        RightSideTrailView(last: last, mission: trail.missions[index])
                    }
                }
            }
            
            Spacer()
        }
 


    }
}

//struct TrailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrailView(bank: TrailBank(id: "-MRBbieNl1cyE1nPtDvK"))
//    }
//}
