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
        
        HStack {
            ForEach(0..<5) { index in
                Button("\(index)") {
                    self.selectedView.index = index
                    delegate?.changeSelectedIndex()
                }
            }
        }
        .background(Color(.systemOrange))
        .cornerRadius(25)

    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedView: SelectedView())
        
    }
}
