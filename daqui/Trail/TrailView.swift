//
//  TrailView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct TrailView: View {
    
    @ObservedObject var bank: MyTrailsBank
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text("Trilha de 50% de desconto")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Por Gelinho Gourmet do Tutu")
                        .font(.callout)
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                
                Spacer()
            }

            VStack {
                ForEach(0..<bank.missions.count, id: \.self) { index in
                    let last = index == bank.missions.count - 1
                    
                    if index % 2 == 0 {
                        LeftSideTrailView(last: last, mission: bank.missions[index])
                    } else {
                        RightSideTrailView(last: last, mission: bank.missions[index])
                    }
                }
            }
            
            Spacer()
        }
 


    }
}

struct TrailView_Previews: PreviewProvider {
    static var previews: some View {
        TrailView(bank: MyTrailsBank())
    }
}
