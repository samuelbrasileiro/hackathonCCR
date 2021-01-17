//
//  MissionView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct MissionView: View {
    
    var color: Color
    @ObservedObject var mission: Mission
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 17)
                .fill(color)
                .frame(width: 125, height: 125)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                if let image = mission.categoryImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 47, height: 47)
                        .font(.largeTitle)
                }

                Text(mission.attributes.title)
                    .multilineTextAlignment(.center)
                    .frame(width: 125)
            }
        }
    }
}
