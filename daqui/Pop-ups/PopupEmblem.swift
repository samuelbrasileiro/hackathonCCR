//
//  PopUpEmblem.swift
//  daqui
//
//  Created by Alanis Lima Santa Clara on 16/01/21.
//

import SwiftUI

struct PopUpEmblem: View {
    
    @State private var isShareSheetShowing = false
    
    
    var body: some View {
        
        VStack{
            Text("Divulgador \nNato!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Image("trofeu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 110)
                .padding(.bottom, 40.0)
            
            VStack(alignment: .leading){
                Text("Ajudou a divulgar um novo produto da comunidade!")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            .padding()
            
            VStack{
                Button(action: {
                    
                    isShareSheetShowing.toggle()
                    
                }, label: {
                    Text("Compartilhar")
                        .fontWeight(.medium)
                })
                .sheet(isPresented: $isShareSheetShowing, onDismiss: {
                    print("Dismiss")
                }, content: {
                    ActivityViewController(activityItems: ["Olha só a nova conquista que consegui no aplicativo Daqui!"])
                })
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            
            .padding()
            
            VStack{
                Button(action: {
                    //aqui vai ter navegação para voltar
                    //falta linkar a navegação
                }, label: {
                    Text("Fechar")
                        .font(.body)
                })
                .foregroundColor(.blue)
            }
            
        }
        .padding()
        
    }
}

struct PopUpEmblem_Previews: PreviewProvider {
    static var previews: some View {
        PopUpEmblem()
    }
}

struct ActivityViewController: UIViewControllerRepresentable {
    
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
    
}
