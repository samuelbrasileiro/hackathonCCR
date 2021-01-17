//
//  Profile.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI

struct RecursosView: View {
    var body: some View {
        ScrollView(.vertical) {
            ZStack{
                VStack(alignment: .leading){
                Text("Recursos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    .padding(.leading)
                
                LazyVStack{
                    RecursosCardView(imgRec: "ImageSebrae",
                                     categoriaRec: "Website",
                                     tituloRec: "Como abrir uma empresa",
                                     descRec: "A formalização e o registro da empresa geram oportunidades e ganhos para o negócio. Além disso, seu empreendimento tem mais chances de fechar parcerias, acessar linhas de crédito...",
                                     linkRec: "https://cutt.ly/VhbEZF8",
                                     nomeLinkRec: "www.sebrae.com.br")
                    
                    RecursosCardView(imgRec: "ImageContaAzul",
                                     categoriaRec: "Website",
                                     tituloRec: "Passo a passo para tirar as ideias do papel",
                                     descRec: "Conheça as características de um empreendedor de sucesso, aprenda a fazer um planejamento eficiente, veja todas as etapas...",
                                     linkRec: "https://blog.contaazul.com/como-abrir-uma-empresa/",
                                     nomeLinkRec: "www.blog.contaazul.com")
                    
                    RecursosCardView(imgRec: "ImageSebrae",
                                     categoriaRec: "Documento PDF",
                                     tituloRec: "Dicas de marketing para pequenos negócios",
                                     descRec: "Entender o comportamento de consumo de seu cliente, aumentar o potencial de vendas e identificar novas oportunidades de negócios.",
                                     linkRec: "https://www.sebrae.com.br/Sebrae/Portal%20Sebrae/UFs/MG/Sebrae%20de%20A%20a%20Z/Plano+de+Marketing.pdf",
                                     nomeLinkRec: "www.sebrae.com.br")
                    
                    RecursosCardView(imgRec: "ImageRockcontent",
                                     categoriaRec: "Website",
                                     tituloRec: "O que é e como criar um logotipo",
                                     descRec: "A identidade de uma marca é um dos principais elementos que dão suporte para a criação de uma empresa consistente e reconhecida no mercado.",
                                     linkRec: "https://cutt.ly/VhbEZF8",
                                     nomeLinkRec: "www.rockcontent.com/br/blog")
                    
                }
                .padding(.horizontal, 10)
            }
            }
        }
    }
}

struct Recursos_Previews: PreviewProvider {
    static var previews: some View {
        RecursosView()
    }
}
