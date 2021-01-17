//
//  SelectPrizeView.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct SelectPrizeView: View {
    
    @State var discount: String = ""
    @State var product: String = "Ex: A partir de 10 sacolés"
    @Binding var isActive: Bool
    @State private var showingAlert = false
    
    var missionIndices: [Bool]
    
    var body: some View {
        VStack {
            HStack{
                Text("Monte Sua Trilha")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
                
            }
            HStack{
                Text("Digite a porcentagem de desconto e em qual produto esse cupom pode ser aplicado!")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                Spacer()
            }
            
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(Color(.poolCyan))
                
                VStack {
                    Text("Aproveite seu \n cupom Daqui!")
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(.white))
                        .padding(.top)
                        .frame(height: 90)
                        
                    Image("qr-code")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Text("24SF3A")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color(.white))
                    
                    HStack {
                        Circle()
                            .fill(Color(.systemBackground))
                            .frame(width: 40, height: 50)
                            .offset(x: -20)
                            .shadow(color: Color(.systemBackground), radius: -20, x: 10)
                        
                        Line()
                            .stroke(Color(.white), style: StrokeStyle(lineWidth: 2, dash: [5]))
                            .frame(height: 3)

                        Circle()
                            .fill(Color(.systemBackground))
                            .frame(width: 40, height: 50)
                            .offset(x: 20)
                            .shadow(color: Color(.systemBackground), radius: -20, x: -10)
                    }
                    
                    HStack {
                        Circle()
                            .fill(Color(.systemGray2))
                            .frame(width: 70, height: 70)
                            .padding(.leading)
                        
                        VStack(alignment: .leading) {
                            HStack{
                                TextField("--%", text: $discount)
                                    .accentColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 70)
                                
                                TextEditor(text: $product)
                                    .foregroundColor(Color(.black))
                                    .background(Color(.clear))
                                    .frame(width: 120, height: 60)
                                    .lineLimit(3)
                                    .font(.body)
                                
                                Spacer()
                            }

                            Text("em Gelinho Gourmet do Tutu")
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(40)
            
            Button(action: {
                Trail.create(missions: missionIndices, discount: discount, product: product)
                self.showingAlert = !self.showingAlert
                    
            }, label: {
                Text("Criar Trilha")
                    .font(.title3)
                    .bold()
                    .foregroundColor( Color(.systemBackground))
                    .padding(.horizontal, 80)
                    .padding(.vertical, 20)
                    .background(Color(.poolCyan))
                    .cornerRadius(14)
                    .padding(.bottom, 30)
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Trilha criada"), message: Text("Parabéns você criou sua primeira trilha!"), dismissButton: .default(Text("Entendi")))
            }

            
        }
        .background(Color(.systemBackground))
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear{
            NotificationCenter.default.post(name: Notification.Name("hideTabView"), object: nil)
        }

    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: -15, y: 0))
        path.addLine(to: CGPoint(x: rect.width + 15, y: 0))
        return path
    }
}

