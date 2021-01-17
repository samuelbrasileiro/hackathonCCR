//
//  MissionView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct MissionView: View {
    
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 17)
                .fill(color)
                .frame(width: 125, height: 125)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Image(systemName: "airplane")
                    .font(.largeTitle)
                    
                Text("COMPRA\nANTECIPADA")
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView(color: Color(.oceanBlue))
    }
}
