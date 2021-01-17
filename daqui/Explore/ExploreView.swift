//
//  ExploreView.swift
//  daqui
//
//  Created by Samuel Brasileiro on 16/01/21.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var bank: ExploreBank
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    if let user = bank.user{
                        Text("E aí, " + user.attributes.name.split(separator: " ")[0] + "!")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
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
                        Button(action: {
                            
                        }){
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
                        Text("Trilha \(Int(progress*100))%")
                            .fontWeight(.regular)
                            .foregroundColor(Color(.greenLight))
                        Spacer()
                        ProgressView(value: progress)
                            .accentColor(Color(.cyan))
                            .foregroundColor(Color(.cyan))
                            
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
