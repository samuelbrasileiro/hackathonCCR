//
//  MyWalletView.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct MyWalletView: View {
    
    @ObservedObject var bank: MyWalletBank
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, content: {
            Text("Minha carteira")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding()

            Spacer()
        })
        
        ScrollView(.vertical, showsIndicators: true, content: {
            LazyVStack{
                ForEach(bank.prizes) { prize in
                    
                    ZStack {
                        ZStack(alignment: .bottom){
                            ZStack(alignment: .top){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGray6))
                                    .frame(height: 160)
                                
                                
                                Circle()
                                    .fill(Color(.systemBackground))
                                    .frame(width: 40, height: 40)
                                    .offset(y: -20)
                            }
                            Circle()
                                .fill(Color(.systemBackground))
                                .frame(width: 40, height: 40)
                                .offset(y: 20)
                        }
                        .padding()
                        
                        MyWalletContent(prize: prize)
                        
                        
                    }
                }
            }
            .padding(.bottom, 60)
        })

    }
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        let bank = MyWalletBank()
        MyWalletView(bank: bank)
    }
}
