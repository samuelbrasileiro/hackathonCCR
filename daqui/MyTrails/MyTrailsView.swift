//
//  MyTrailsView.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

struct MyTrailsView: View {
    
    
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, content: {
            Text("Minhas trilhas")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding()
            Spacer()
        })
        
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color(.systemGray2), radius: 10, x: 0, y: 0)
                    .frame(height: 137)

                HStack {
                    
//                    if let image = business.image{
//                        Image(uiImage: image)
//                            .resizable()
//                            .frame(width: 72, height: 83)
//                            .clipShape(Circle())
//                            .shadow(radius: 7)
//                            .offset(y: -40)
//                            .padding(.leading)
//                    }
                    
                    VStack(alignment: .leading){
                        Text("Gelinho gourmet do Tutu")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        HStack {
                            Text("Trilha 50%").font(.caption)
                            ProgressView(value: 0.5).padding()
                        }.foregroundColor(Color(.systemTeal))
                        
                        Text("Próxima Atividade: Compartilhar o Gelinho Gourmet nas Redes Sociais.")
                            .font(.caption)
                            .foregroundColor(Color(.systemTeal))
                    }
                }
            }
        })
        .padding()
        .background(Color(.systemGray6))
        
    }
}

struct MyTrailsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTrailsView()
    }
}
