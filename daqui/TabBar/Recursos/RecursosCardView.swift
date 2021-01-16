//
//  RecursosCardView.swift
//  daqui
//
//  Created by Pedro Henrique Spínola de Assis on 16/01/21.
//

import SwiftUI

struct RecursosCardView: View {
    
    var imgRec: String
    var categoriaRec: String
    var tituloRec: String
    var descRec: String
    var linkRec: String
    var nomeLinkRec: String
    
    var body: some View {
        VStack{
            VStack {
                HStack {
                    Image(imgRec)
                        .cornerRadius(3.0)
                        .padding(.horizontal, 8)
                    //                    .resizable()
                    //                    .aspectRatio(contentMode: .fit)
                    
                    VStack(alignment: .leading) {
                        Text(tituloRec)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                            .padding(.top)
                            .padding(.trailing)
                        
                        
                        
                        Link(destination: URL(string: linkRec)!, label: {
                            Text(nomeLinkRec)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .underline()
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                                .padding(.bottom, 1)
                            
                        })
                        
                        
                        Text(descRec)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .lineLimit(3)
                            .padding([.bottom, .trailing], 15)
                            
                        
                    }
                }
            }
            .background(Color.white)
            .border(Color.gray, width: 0.5)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 0, y: 1)
            //        .padding([.top, .horizontal])
            
            HStack{
                Image(categoriaRec)
                Text(categoriaRec)
                    .font(.footnote)
                    .foregroundColor(.orange)
                Spacer()
            }.padding(.leading)
        }.padding(.top)
    }
}

struct RecursosCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecursosCardView(imgRec: "ImageSebrae",
                         categoriaRec: "Website",
                         tituloRec: "Como abrir uma empresa",
                         descRec: "A formalização e o registro da empresa geram oportunidades e ganhos para o negócio. Além disso...",
                         linkRec: "https://cutt.ly/VhbEZF8",
                         nomeLinkRec: "www.sebrae.com.br")
    }
}
