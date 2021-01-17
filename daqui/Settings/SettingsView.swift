//
//  SettingsView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var costumer: Costumer
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline){
                Image(systemName: "chevron.left")
                    .foregroundColor(Color(.cyan))
                    .font(.largeTitle)
                
                Text("Configurações")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                
                Spacer()
            }.padding()
            
            if let image = costumer.image {
                Image(uiImage: image)
                    .frame(width: 120, height: 120)
                    .mask(Circle())
                    .padding()
            }

            Button(action: {
                print("Adicionar função de mudar foto")
            }) {
                Text("Mudar foto")
                    .foregroundColor(Color(.cyan))
            }
            
            Text("Meu nome").tablefy()
            Text("Minha localização").tablefy()
            Text("Meu email").tablefy()
            Text("Meu número").tablefy()


            Divider()
            
            //TODO: ADICIONAR UM TEXT: NOSSOS PLANOS
            
            HStack {
                Text("Plano Grátis")
                    .bold()
                
                Spacer()
                
                Text("Plano Atual")
                    .font(.footnote)
            }
            .padding()
            .border(Color(.systemGray))
            .padding()
            .foregroundColor(Color(.systemGray))
            
            Image("PlanoPremium")
                .resizable()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(costumer: Costumer(database: Costumer.Database(name: "Danilo Lira", email: "danilo.lira01@gmail.com", phone: "81  993452332", imgURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", location: "Pernambuco", id: "1")))
    }
}

extension View {
    func tablefy() -> some View {
        self.modifier(Tablefy())
    }
}
