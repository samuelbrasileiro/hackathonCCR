//
//  TrailView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct TrailView: View {
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
                LeftSideTrailView()
                RightSideTrailView()
                LeftSideTrailView()
                RightSideTrailView(last: true)
            }
            
            Spacer()
        }
 


    }
}

struct TrailView_Previews: PreviewProvider {
    static var previews: some View {
        TrailView()
    }
}
