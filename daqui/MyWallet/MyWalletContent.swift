//
//  MyWalletContent.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct MyWalletContent: View {
    
    @ObservedObject var prize: Prize
    
    var body: some View {
        HStack {
            if let trail = prize.trail{
                
                TrailImageView(trail: trail)
                    .shadow(radius: 7)
            } else {
                Circle()
                    .fill(Color(.gray))
                    .frame(width: 86, height: 86, alignment: .leading)
            }
            VStack {
                HStack {
                    Text(prize.attributes.discount)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    Text(prize.attributes.amount)
                }

                Text(prize.attributes.product)
            }
        }
    }
    
    struct TrailImageView: View{
        @ObservedObject var trail: Trail
        
        var body: some View{
            if let business = trail.business{
                BusinessImageView(business: business)
            }else {
                Circle()
                    .fill(Color(.gray))
                    .frame(width: 86, height: 86, alignment: .leading)
            }
        }
    }
    
    struct BusinessImageView: View{
        @ObservedObject var business: Business
        
        var body: some View{
            if let image = business.image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 86, height: 86)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color(.gray))
                    .frame(width: 86, height: 86, alignment: .leading)
            }
        }
    }
    
}

