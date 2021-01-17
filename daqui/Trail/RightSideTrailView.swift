//
//  RightSideTrailView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct RightSideTrailView: View {
    
    var last: Bool = false
    @ObservedObject var mission: Mission
    
    var body: some View {
        HStack{
            MissionView(color: Color(.poolCyan), mission: mission)
                .padding(.leading)
            
            if !last {
                Image("Trail_Way2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 159, height: 93)
                    .offset(x: -10, y: 30)
            } else {
                Spacer()
            }

        }
    }
}

//struct RightSideTrailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RightSideTrailView()
//    }
//}
