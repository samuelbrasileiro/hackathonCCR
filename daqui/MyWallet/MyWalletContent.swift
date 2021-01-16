//
//  MyWalletContent.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct MyWalletContent: View {
    
    var discount: String
    var amount: String
    var product: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color(.gray))
                .frame(width: 86, height: 86, alignment: .leading)
            
            VStack {
                HStack {
                    Text(discount)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    Text(amount)
                }

                Text(product)
            }
        }
    }
}

