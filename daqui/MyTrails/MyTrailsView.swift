//
//  MyTrailsView.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct MyTrailsView: View {
    
    @ObservedObject var bank: MyTrailsBank
    @State var navigatedToTrail = false
    
    var body: some View {
        NavigationView {
            VStack{
                HStack(alignment: .firstTextBaseline){
                    Text("Minhas trilhas")
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                
                ScrollView(.vertical, showsIndicators: true, content: {
                    ForEach(0..<bank.trails.count, id: \.self) { index in
                        
                        NavigationLink(
                            destination: TrailView(trail: bank.trails[index], isActive: $navigatedToTrail),
                            isActive: $navigatedToTrail) {
                            TrailViewContent(bank: bank, trail: bank.trails[index]).padding(.vertical)
                        }
                    }
                    
                })
            }
            .padding()
            .background(Color(.systemGray6))
            .navigationBarHidden(true)
        }
    }
}

struct MyTrailsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTrailsView(bank: MyTrailsBank())
    }
}
