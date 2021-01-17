//
//  ExploreView.swift
//  daqui
//
//  Created by Samuel Brasileiro on 16/01/21.
//

import SwiftUI
import FirebaseCore
struct ExploreView: View {
    @ObservedObject var bank: ExploreBank
    
    @State var navigatedToBusiness = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        if let user = bank.user{
                            HStack{
                            Text("E aí, " + user.attributes.name.split(separator: " ")[0] + "!")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            Spacer()
                                NavigationLink(destination: Text("Configurações")){
                                    Image(systemName: "gearshape.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                .foregroundColor(Color(.systemTeal))
                                .padding()
                            }
                            Text("Bora conhecer novas empresas perto de você?!")
                                .font(.subheadline)
                            
                        }
                        
                    }
                    .padding([.leading, .top])
                    Spacer()
                    
                }
                SearchBarView(bank: bank)
                    .padding(.horizontal)
                Spacer()
                ScrollView{
                    VStack {
                        ForEach(0..<bank.businesses.count, id: \.self) { index in
                            NavigationLink(
                                destination: ProfileView(business: bank.businesses[index], isActive: $navigatedToBusiness),
                                isActive: $navigatedToBusiness){
                                
                                ExploreBusiness(business: bank.businesses[index])
                                    . padding()
                            }
                        }
                    }
                    .padding(.bottom, 80)
                    .resignKeyboardOnDragGesture()
                }
                
            }
            .background(Color(.systemGray6))
            .navigationBarHidden(true)
        }
    }
}

struct ExploreBusiness: View{
    @ObservedObject var business: Business
    
    @State private var progress = 0.5
    
    
    var body: some View{
        
        VStack(spacing: 0){
            if let image = business.coverImage{
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 100)
            }
            HStack{
                if let image = business.image{
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .shadow(radius: 7)
                        .offset(y: -40)
                        .padding(.leading)
                }
                VStack(alignment: .leading){
                    Text(business.attributes.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text(business.attributes.promotionalText)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    HStack{
                        if business.hasNewTrail{
                            
                            Text("Nova trilha disponível")
                                .fontWeight(.medium)
                            Spacer()
                        }
                        else{
                            let pg = Int.random(in: 0...100)
                            Text("Trilha \(pg)%")
                            .fontWeight(.regular)
                            .foregroundColor(Color(.greenLight))
                        Spacer()
                        ProgressView(value: CGFloat(pg)/100)
                            .accentColor(Color(.cyan))
                            .foregroundColor(Color(.cyan))
                        }
                    }
                    .padding(.trailing)
                }
                .padding(10)
            }
            .background(Color(.systemBackground))
            
        }
        .cornerRadius(10)
        .shadow(radius: 7)
        .padding(.horizontal)
    }
}
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(bank: ExploreBank())
            .environment(\.colorScheme, .light)
    }
}
