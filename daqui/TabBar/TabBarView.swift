//
//  TabBarView.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var selectedView: SelectedView
    var delegate: SelectedViewDelegate?
    
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.systemBackground))
                .cornerRadius(25)
                .shadow(color: Color(.systemGray2), radius: 10, x: 0, y: 0)
            
            HStack {
                ForEach(0..<self.selectedView.items.count) { index in
                    Button(action: {
                        self.selectedView.index = index
                        delegate?.changeSelectedIndex()
                    }) {
                        Image(systemName: "house.circle.fill")
                            .font(Font.system(.largeTitle))
                            .padding()

                    }
                    
                }
            }

        }


    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView(selectedView: SelectedView())
//
//    }
//}
