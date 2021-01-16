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
                    .fill(Color(.systemGray6))
                    .frame(height: 137)
                    .shadow(color: Color(.systemGray2), radius: 10, x: 0, y: 0)
                    .padding()
                
                HStack {
                    Circle()
                        .fill(Color(.systemGray2))
                        .frame(width: 72, height: 83)
                    
                    VStack {
                        Text("Gelinho gourmet do Tutu")
                            .font(.title)
                            .fontWeight(.medium)
                        HStack {
                            Text("Trilha X%")
                            ProgressView(value: 0.5)
                        }
                        
                        HStack {
                            Text("Próxima Atividade: ")
                            
                            Text("Compartilhar o Gelinho Gourmet nas Redes Sociais")
                        }
                    }
                }

            }
            

                
        })
    }
}

struct MyTrailsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTrailsView()
    }
}
