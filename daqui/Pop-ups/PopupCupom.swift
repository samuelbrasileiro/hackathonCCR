//
//  PopUpCumpom.swift
//  daqui
//
//  Created by Alanis Lima Santa Clara on 16/01/21.
//

import SwiftUI

struct PopUpCupom: View {
    
    @State private var isShareSheetShowing = false
    
    var body: some View {
        
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            
            ZStack{
                Image("base-cupom")
                
                VStack{
                    Text("Aproveite seu \ncupom daqui!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Image("qr-code")
                    
                    Text("24SF3A")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                }
                .padding(.bottom, 150.0)
                Spacer()
            }
            
            VStack {
                HStack{
                    Text("50%")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .position(x: 175, y:510)
                    
                    Text("a partir de \n10 sacolés")
                        .font(.subheadline)
                        .position(x: 50, y:510)
                        .lineLimit(2)
                }
            }

            
            VStack{
                Button(action: {
                    
                    isShareSheetShowing.toggle()
                    
                }, label: {
                    Text("Compartilhar")
                        .fontWeight(.medium)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                })
                .sheet(isPresented: $isShareSheetShowing, onDismiss: {
                    print("Dismiss")
                }, content: {
                    ActivityViewController(activityItems: ["Olha só o cupom que consegui no aplicativo Daqui!"])
                })
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .position(x:195, y:650)
            }
            
            .padding()
            
            VStack{
                Button(action: {
                    //aqui vai ter navegação para voltar
                    //falta linkar a navegação
                }, label: {
                    Text("Fechar")
                        .font(.body)
                        .position(x:210, y:730)
                    
                })
                .foregroundColor(.white)
            }
            
            
        }
    }
}

struct PopUpCumpom_Previews: PreviewProvider {
    static var previews: some View {
        PopUpCupom()
    }
}
