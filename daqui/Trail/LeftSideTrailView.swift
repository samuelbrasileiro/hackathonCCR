//
//  LeftSideTrailView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct LeftSideTrailView: View {
    
    var last: Bool = false
    
    var body: some View {
        HStack {
            if !last {
                Image("Trail_Way1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 159, height: 93)
                    .offset(x: 10, y: 30)
            } else {
                Spacer()
            }

            
            MissionView(color: Color(.oceanBlue))
                
        }
    }
}

struct LeftSideTrailView_Previews: PreviewProvider {
    static var previews: some View {
        LeftSideTrailView()
    }
}
