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
        HStack(alignment: .firstTextBaseline, content: {
            Text("Minha carteira")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding()

            Spacer()
        })
        
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            ForEach(prizes.prizes) { prize in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                        .frame(height: 137)
                        .shadow(color: Color(.systemGray2), radius: 10, x: 0, y: 0)
                        .padding()
                    
                    MyWalletContent(discount: prize.discount, amount: prize.amount, product: prize.product)
                }
            }
        })

    }
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        let bank = MyWalletBank()
        MyWalletView(prizes: bank)
    }
}
