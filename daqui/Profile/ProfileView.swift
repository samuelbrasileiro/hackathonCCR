//
//  Profile.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI

struct ProfileView: View {
    var business: Business
    
    @Binding var isActive: Bool
    
    @State var isStoryShown: Bool = false
    var body: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                if let image = business.coverImage{
                    ZStack(alignment: .topLeading){
                        Image(uiImage: image)
                            .resizable()
                            .frame(height: 140)
                        if isActive{
                            Button(action:{
                                isActive = false
                            }){
                                Image(systemName: "chevron.left")
                                    .padding()
                                    .background(Color(.systemBackground))
                                    .foregroundColor(Color(.systemTeal))
                                    .clipShape(Circle())
                                    .padding()
                            }
                            .padding(.top, 20)
                        }
                    }
                }
                
                HStack{
                    if let image = business.image{
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(radius: 7)
                            
                            .padding(.top, -60)
                            .padding(.leading)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text(business.attributes.name)
                            
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                        Text(business.attributes.promotionalText)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color(.systemGray))
                        
                    }
                    .padding(.trailing, 10)
                    Spacer()
                }
                
                VStack{
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color(.cyan))
                        Text(business.attributes.location)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color(.systemGray))
                        Spacer()
                    }
                    HStack(spacing: 16){
                        Button(action:{
                            
                        }){
                            Image("phone")
                                .frame(width: 20, height: 20)
                                .padding(14)
                                .background(Color(.cyan))
                                .clipShape(Circle())
                        }
                        Button(action:{
                            
                        }){
                            Image("insta")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(14)
                                .background(Color(.cyan))
                                .clipShape(Circle())
                        }
                        Button(action:{
                            
                        }){
                            Image("zap")
                                .frame(width: 20, height: 20)
                                .padding(14)
                                .background(Color(.cyan))
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("Nossa história")
                                .font(.system(size: 20, weight: .medium, design: .default))
                            Spacer()
                            Button(action:{
                                isStoryShown.toggle()
                            }){
                                Image(systemName: "chevron." + (isStoryShown ? "up" : "down"))
                            }
                        }
                        .padding(.bottom, 5)
                        if let description = business.attributes.description{
                            Text(description)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .lineLimit(isStoryShown ? 100 : 3)
                        }
                        
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 7)
                    .padding([.top, .bottom, .trailing])
                    .frame(maxHeight: .infinity)
                    
                }
                
                .padding(.leading)
                .padding(.top, 10)
                
                .padding(.bottom)
                
                Text("Acesse nossa trilha!")
                    .font(.headline)
                    .padding(.leading)
                Button(action:{
                    
                }){
                    Image("coupon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 7)
                }
                
                Spacer()
            }
            
        }
        .background(Color(.systemGray6))
        .animation(.spring())
        .frame(maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(business: Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé\nO nome não importa, o que importa é o sabor! e nisso a gente se garante :)\nDudu do Bom!\nO seu sorvete no saquinho, o dudu gourmet mais delicioso da região.", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), isActive: .constant(true))
    }
}
