//
//  Create_Trail.swift
//  daqui
//
//  Created by Samuel Brasileiro on 17/01/21.
//

import SwiftUI


struct TrailMissionSelectionView: View{
    
    @State var selectedIndexes: [Bool] = (0..<Mission.missions.count).map{_ in false}
    @State var navigatedToSelectPrize = false
    
    var missions = Mission.missions
    var body: some View{
        NavigationView {
            ZStack(alignment: .bottom){
                VStack{
                    HStack{
                        Text("Selecione as categorias que você acha mais importante no momento. Escolha no máximo quatro opções.")
                            .foregroundColor(.secondary)
                            .padding()
                        Spacer()
                        
                    }
                    ScrollView{
                        LazyVStack(spacing: 25){
                            ForEach(0..<missions.count, id: \.self){ index in
                                MissionToSelectView(mission: missions[index], isSelected: $selectedIndexes[index])
                            }
                        }
                        .padding(.bottom, 130)
                        .padding()
                        
                    }
                    
                    
                }
                
                .background(Color(.systemGray6))
                ZStack{
                    Rectangle()
                        .fill(Color(.systemBackground))
                        .frame(height: 120)
                        .shadow(radius: 20 )
                    
                    
                    NavigationLink(
                        destination: SelectPrizeView(isActive: $navigatedToSelectPrize, missionIndices: selectedIndexes),
                        isActive: $navigatedToSelectPrize,
                        label: {
                            Text("Próximo")
                                .font(.title3)
                                .bold()
                                .foregroundColor( Color(selectedIndexes.contains(true) ? .systemBackground : .systemBackground))
                                .padding(.horizontal, 80)
                                .padding(.vertical, 20)
                                .background(Color(selectedIndexes.contains(true) ? .poolCyan : .systemGray2))
                                .cornerRadius(14)
                        })
                }
                .navigationBarTitle("Monte sua trilha")
            }.ignoresSafeArea(.all, edges: .bottom)
        }
        .onAppear{
            NotificationCenter.default.post(name: Notification.Name("hideTabView"), object: nil)
        }
        
    }
    
}

struct MissionToSelectView: View{
    
    @ObservedObject var mission: Mission
    
    @Binding var isSelected: Bool
    
    var body: some View{
        Button(action:{
            isSelected.toggle()
        }){
        HStack{
            if let image = mission.categoryImage{
                Image(uiImage: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    
                    .foregroundColor((Color(isSelected ? .systemBackground : .systemGray)))
                    .padding()
            }
            else{
                Circle()
                    .fill(Color(isSelected ? .systemBackground : .systemGray2))
                    .frame(width: 40, height: 40)
                    .padding()
            }
            VStack(alignment: .leading){
                Text(mission.attributes.title)
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 5)
                Text(mission.attributes.description)
                    .font(.subheadline)
            }
            .foregroundColor(Color(isSelected ? .systemBackground : .systemGray))

            .padding()
            
            Spacer()
        }
        }
        .background(Color(isSelected ? .poolCyan : .systemBackground))
        .cornerRadius(14)
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 1).foregroundColor(Color(isSelected ? .systemBackground : .systemGray2)))
    }
}


struct TrailMissionSelection_PreviewProvider: PreviewProvider{
    
    static var previews: some View{
        TrailMissionSelectionView()
    }
    
    
}
