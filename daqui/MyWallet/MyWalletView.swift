//
//  MyWalletView.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct MyWalletView: View {
    
    @ObservedObject var prizes: MyWalletBank
    
    var body: some View {
        Text("Minha carteira")
            .fontWeight(.heavy)
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .padding(.top)
        
        ForEach(prizes.prizes) { prize in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray6))
                    .frame(height: 137)
                    .shadow(color: Color(.systemGray2), radius: 10, x: 0, y: 0)
                    .padding()
                
                HStack {
                    Circle()
                        .fill(Color(.gray))
                        .frame(width: 86, height: 86, alignment: .leading)
                    
                    VStack {
                        HStack {
                            Text(prize.discount)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                            
                            Text(prize.amount)
                        }

                        Text(prize.product)
                    }
                }
            }
        }
        Spacer()
    }
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        let bank = MyWalletBank()
        MyWalletView(prizes: bank)
    }
}
