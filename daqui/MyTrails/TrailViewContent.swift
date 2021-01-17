//
//  TrailView.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct TrailViewContent: View {
    
    @ObservedObject var bank: MyTrailsBank
    let trail: Trail
    let business: Business
    let trailProgress: Float
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
                .shadow(radius: 10, x: 0, y: 0)
                .frame(height: 137)

            HStack {
                if let image = business.image{
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 72, height: 83)
                        .clipShape(Circle())
                        .shadow(radius: 7)
                        .padding(.leading)
                }
                
                VStack(alignment: .leading){
                    Text(business.attributes.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text("Trilha \(String.init(format: "%.0f", trailProgress))%")
                            .fontWeight(.regular)
                            .foregroundColor(Color(.greenLight))
                        ProgressView(value: (trailProgress/100)).padding()
                            .foregroundColor(Color(.cyan))
                    }
                    
                    Text("Próxima Atividade: Compartilhar o Gelinho Gourmet nas Redes Sociais.")
                        .font(.caption)
                        .foregroundColor(Color(.cyan))
                }
            }
        }
    }
        
}
