//
//  MyTrailsView.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct MyTrailsView: View {
    
    @ObservedObject var bank: MyTrailsBank
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, content: {
            Text("Minhas trilhas")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding()
            Spacer()
        })
        
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            ForEach(0..<bank.trails.count, id: \.self) { index in
                let trail = bank.trails[index]
                let business = bank.getBusiness(by: trail.attributes.idBusiness).first!
                let trailProgress = bank.getTrailCompletion(by: trail.attributes.id)
                
                Button(action: {
                    
                }) {
                    TrailView(bank: bank, trail: trail, business: business, trailProgress: trailProgress)
                        .padding()
                }

            }

        })
        .padding()
        .background(Color(.systemGray6))
        
    }
}

struct MyTrailsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTrailsView(bank: MyTrailsBank())
    }
}
