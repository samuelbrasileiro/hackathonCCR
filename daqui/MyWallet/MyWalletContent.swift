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
    var business: Business?
    
    var body: some View {
        HStack {
            if let safeBusiness = business{
                Image(uiImage: safeBusiness.image!)
                    .resizable()
                    .frame(width: 86, height: 86)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color(.gray))
                    .frame(width: 86, height: 86, alignment: .leading)
            }
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

