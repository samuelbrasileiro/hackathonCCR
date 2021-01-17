//
//  TrailView.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct TrailViewContent: View {
    
    @ObservedObject var bank: MyTrailsBank
    @ObservedObject var trail: Trail
    
    struct BusinessImageViewContent: View{
        @ObservedObject var business: Business
        var body: some View{
            if let image = business.image{
            Image(uiImage: image)
                .resizable()
                .frame(width: 72, height: 83)
                .clipShape(Circle())
                .shadow(radius: 7)
                .padding(.leading)
            }
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
                .shadow(radius: 10, x: 0, y: 0)
                .frame(height: 137)

            HStack {
                if let business = trail.business{
                    BusinessImageViewContent(business: business)
                }
            
                VStack(alignment: .leading){
                    if let business = trail.business{
                        Text(business.attributes.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    HStack {
                        Text("Trilha \(String.init(format: "%.0f", bank.getTrailCompletion(by: trail.attributes.id)))%")
                            .fontWeight(.regular)
                            .foregroundColor(Color(.poolCyan))
                        ProgressView(value: (bank.getTrailCompletion(by: trail.attributes.id)/100)).padding()
                            .accentColor(Color(.poolCyan))
                    }
                    
                    Text("Próxima Atividade: Compartilhar o Gelinho Gourmet nas Redes Sociais.")
                        .font(.caption)
                        .foregroundColor(Color(.poolCyan))
                }
            }
        }
        
    }
        
}
